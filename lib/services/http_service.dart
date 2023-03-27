import 'package:http/http.dart' as http;

class HttpService {
  static const baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/";

  static Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(baseUrl + url));
  }

  static Future<http.Response> post(String url) async {
    return await http.post(Uri.parse(baseUrl + url));
  }
}
