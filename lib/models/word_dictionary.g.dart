// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDictionary _$WordDictionaryFromJson(Map<String, dynamic> json) =>
    WordDictionary(
      word: json['word'] as String,
      phonetic: json['phonetic'] as String,
      phonetics: (json['phonetics'] as List<dynamic>)
          .map((e) => Phonetic.fromJson(e as Map<String, dynamic>))
          .toList(),
      origin: json['origin'] as String,
      meanings: (json['meanings'] as List<dynamic>)
          .map((e) => Meaning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WordDictionaryToJson(WordDictionary instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'phonetics': instance.phonetics,
      'origin': instance.origin,
      'meanings': instance.meanings,
    };

Meaning _$MeaningFromJson(Map<String, dynamic> json) => Meaning(
      partOfSpeech: json['partOfSpeech'] as String,
      definitions: (json['definitions'] as List<dynamic>)
          .map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeaningToJson(Meaning instance) => <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
    };

Definition _$DefinitionFromJson(Map<String, dynamic> json) => Definition(
      definition: json['definition'] as String,
      example: json['example'] as String,
      synonyms: json['synonyms'] as List<dynamic>,
      antonyms: json['antonyms'] as List<dynamic>,
    );

Map<String, dynamic> _$DefinitionToJson(Definition instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };

Phonetic _$PhoneticFromJson(Map<String, dynamic> json) => Phonetic(
      text: json['text'] as String,
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$PhoneticToJson(Phonetic instance) => <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
    };
