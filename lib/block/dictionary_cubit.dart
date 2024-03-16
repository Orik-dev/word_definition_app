import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      if(words == null){
        emit(ErrorState('There is some issue'));
      }else{
        print(words.toString());
        WordSearchedState(words);
      }
    } on Exception catch (e) {
    emit(ErrorState(e.toString()));
    }
  }
}

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordDictionary> words;

  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState {
  final  message;

  ErrorState(this.message);
}
