import 'dart:convert';

import 'package:bloc_test/model/word_response.dart';
import 'package:bloc_test/service/http_service.dart';

class WordRepo{
  Future<dynamic>getWordFromDictionary(String query)async{

    try{
      final response=await HttpService.getRequests('en/$query');
      var responseData= json.decode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
     List data =map.values.toList();
      List parsedData=[];
      for (var element in data) {parsedData.add(WordResponse.fromJson(element));}
      return parsedData;
    }catch(e){
      throw Exception(e);
    }
  }
}