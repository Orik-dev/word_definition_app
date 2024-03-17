import 'package:word_definition_app/models/word_dictionary.dart';

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordDictionary> words;

  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState {
  final message;

  ErrorState(this.message);
}
