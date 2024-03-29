import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_definition_app/block/dictionary_state.dart';
import 'package:word_definition_app/models/word_dictionary.dart';
import 'package:word_definition_app/repository/word_repository.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;

  DictionaryCubit(this._repository) : super(NoWordSearchedState());

  final queryController = TextEditingController();

  Future getWordSearched() async {
    emit(WordSearchingState());
    final words = await _repository.getWordsFromDictionary(
      queryController.text,
    );

    try {
      if (words == null) {
        emit(ErrorState('There is some issue'));
      } else {
        if (words.isEmpty) {
          emit(WordSearchedState(
            [WordDictionary(word: queryController.text, isValid: false)],
          ));
        } else {
          emit(WordSearchedState(words));
        }
        emit(NoWordSearchedState());
      }
    } on SocketException catch (e) {
      emit(ErrorState('Отсутствет интернет-соединение'));
    } catch (e) {
      emit(ErrorState('Ошибка $e'));
    }
  }
}
