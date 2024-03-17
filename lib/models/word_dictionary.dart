import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'word_dictionary.g.dart';

@JsonSerializable()
class WordDictionary {
  WordDictionary({
    this.word,
    this.phonetics,
    this.meanings,
    this.isValid = true,
  });

  String? word;
  List<Phonetic>? phonetics;
  List<Meaning>? meanings;
  bool isValid;

  factory WordDictionary.fromJson(Map<String, dynamic> json) => _$WordDictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$WordDictionaryToJson(this);
}

@JsonSerializable()
class Meaning {
  Meaning({
    this.partOfSpeech,
    this.definitions,
  });

  String? partOfSpeech;
  List<Definition>? definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}

@JsonSerializable()
class Definition {
  Definition({
    this.definition,
    this.example,
    this.synonyms,
  });

  String? definition;
  String? example;
  List<String>? synonyms;

  factory Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);
}

@JsonSerializable()
class Phonetic {
  Phonetic({
    this.text,
    this.audio,
  });

  String? text;
  String? audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => _$PhoneticFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticToJson(this);
}

List<WordDictionary> wordResponseFromJson(String str) =>
    List<WordDictionary>.from(json.decode(str).map((x) => WordDictionary.fromJson(x)));

String wordResponseToJson(List<WordDictionary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));