import 'package:json_annotation/json_annotation.dart';

part 'word_dictionary.g.dart';

@JsonSerializable()
class WordDictionary {
  @JsonKey(name: "word")
  String word;
  @JsonKey(name: "phonetic")
  String phonetic;
  @JsonKey(name: "phonetics")
  List<Phonetic> phonetics;
  @JsonKey(name: "origin")
  String origin;
  @JsonKey(name: "meanings")
  List<Meaning> meanings;

  WordDictionary({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  factory WordDictionary.fromJson(Map<String, dynamic> json) => _$WordDictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$WordDictionaryToJson(this);
}

@JsonSerializable()
class Meaning {
  @JsonKey(name: "partOfSpeech")
  String partOfSpeech;
  @JsonKey(name: "definitions")
  List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}

@JsonSerializable()
class Definition {
  @JsonKey(name: "definition")
  String definition;
  @JsonKey(name: "example")
  String example;
  @JsonKey(name: "synonyms")
  List<dynamic> synonyms;
  @JsonKey(name: "antonyms")
  List<dynamic> antonyms;

  Definition({
    required this.definition,
    required this.example,
    required this.synonyms,
    required this.antonyms,
  });

  factory Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);
}

@JsonSerializable()
class Phonetic {
  @JsonKey(name: "text")
  String text;
  @JsonKey(name: "audio")
  String? audio;

  Phonetic({
    required this.text,
    this.audio,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) => _$PhoneticFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticToJson(this);
}
