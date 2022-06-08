import 'dart:convert';

import 'package:astrodemo/model/all_relative_model.dart';
import 'package:astrodemo/model/ask_question_model.dart';
import 'package:http/http.dart' as http;
class Api{

  static const String baseUrl = "https://staging-api.astrotak.com/api/";
  static Future<AskQuestionModel>getAskQuestion() async {
    var url = "${baseUrl}question/category/all";
    http.Response response = await http.get(Uri.parse(url));
    return AskQuestionModel.fromJson(jsonDecode(response.body));
  }

  static Future<AllRelativeModel> getAllRelativeData() async{

    var url = "${baseUrl}relative/all";
    http.Response response = await http.get(Uri.parse(url),headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IlVTRVIiLCJ1dWlkIjoiODZhYTlhODItYjlhOS00NGFiLTkyYzQtODY4YjIyYzA4ZTY0IiwiaXNFbWFpbFZlcmlmaWVkIjp0cnVlLCJwaG9uZU51bWJlciI6Ijg4MDk3NjUxOTEiLCJlbWFpbCI6ImFiaGlzaGVrLnNhaEBhYWp0YWsuY29tIiwibWFza2VkRW1haWwiOiJhYmgqKioqKioqKiphYWp0YWsuY29tIiwiZXhpc3RpbmdVc2VyIjpmYWxzZSwiaWF0IjoxNjQ3OTQ1MjY3LCJleHAiOjE2Njc5NDUyNjd9.whYbyeeBt91qni3zzp5eaitD2eKVnPI5scjiG49J_ks'
    });

    return AllRelativeModel.fromJson(jsonDecode(response.body));
  }

  static deleteRelative(String s) async {

    var url = "${baseUrl}relative/delete/$s";

    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IlVTRVIiLCJ1dWlkIjoiODZhYTlhODItYjlhOS00NGFiLTkyYzQtODY4YjIyYzA4ZTY0IiwiaXNFbWFpbFZlcmlmaWVkIjp0cnVlLCJwaG9uZU51bWJlciI6Ijg4MDk3NjUxOTEiLCJlbWFpbCI6ImFiaGlzaGVrLnNhaEBhYWp0YWsuY29tIiwibWFza2VkRW1haWwiOiJhYmgqKioqKioqKiphYWp0YWsuY29tIiwiZXhpc3RpbmdVc2VyIjpmYWxzZSwiaWF0IjoxNjQ3OTQ1MjY3LCJleHAiOjE2Njc5NDUyNjd9.whYbyeeBt91qni3zzp5eaitD2eKVnPI5scjiG49J_ks'
        }
    );
    print(response.body);
    return jsonDecode(response.body);
  }

}