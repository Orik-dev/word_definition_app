import 'dart:convert';
import 'dart:io';
import 'package:word_definition_app/models/word_dictionary.dart';
import 'package:word_definition_app/services/http_service.dart';

class WordRepository {
  Future<List<WordDictionary>?> getWordsFromDictionary(String query) async {
    try {
      final response = await HttpService.getRequest('en/$query');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<WordDictionary> resultList = [];

        for (var jsonData in jsonList) {
          final wordDictionary = WordDictionary.fromJson(jsonData);
          resultList.add(wordDictionary);
        }
        return resultList;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw (e);
    }
  }
}
