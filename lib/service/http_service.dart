import 'package:http/http.dart' as http;

class HttpService {
  static const baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/';

  static Future<http.Response> getRequests(endPoint) async {
    http.Response response;
    final url = Uri.parse('$baseUrl$endPoint');
    try{
      response=await http.get(url);

    }catch(e){
      throw Exception(e);
    }
  return response;
  }
}
