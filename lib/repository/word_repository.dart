import 'dart:io';
import 'package:word_definition_app/models/word_dictionary.dart';
import 'package:word_definition_app/services/http_service.dart';

class WordRepository {
  Future<List<WordDictionary>?> getWordsFromDictionary(String query) async {
    final response = await HttpService.getRequest('en/$query');
    try {

      if (response.statusCode == 200) {
        final result = wordResponseFromJson(response.body);

        return result;
      } else {
        return [];
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
