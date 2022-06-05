import 'dart:convert';

import 'package:astrodemo/model/ask_question_model.dart';
import 'package:http/http.dart' as http;
class Api{

  static const String baseUrl = "https://staging-api.astrotak.com/api/";
  static Future<AskQuestionModel>getAskQuestion() async {
    var url = "${baseUrl}question/category/all";
    http.Response response = await http.get(Uri.parse(url));
    return AskQuestionModel.fromJson(jsonDecode(response.body));
  }

}