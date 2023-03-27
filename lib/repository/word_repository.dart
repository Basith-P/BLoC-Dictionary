import 'dart:io';

import '../models/word_details.dart';
import '../services/http_service.dart';

class WordRepostory {
  Future<List<WordDetails>> getWordDetails(String word) async {
    try {
      final response = await HttpService.get("en_US/$word");

      if (response.statusCode == 200) {
        return wordDetailsFromJson(response.body);
      } else if (response.statusCode == 404) {
        return List.empty();
      } else {
        print(response.body);
        throw Exception("Failed to load word details");
      }
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
