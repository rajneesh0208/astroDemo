import 'dart:convert';

import 'package:astrodemo/model/all_relative_model.dart';
import 'package:astrodemo/model/ask_question_model.dart';
import 'package:astrodemo/model/city_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = "https://staging-api.astrotak.com/api/";
static const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E';
  static Future<AskQuestionModel> getAskQuestion() async {
    var url = "${baseUrl}question/category/all";
    http.Response response = await http.get(Uri.parse(url));
    return AskQuestionModel.fromJson(jsonDecode(response.body));
  }

  static Future<AllRelativeModel> getAllRelativeData() async{

    var url = "${baseUrl}relative/all";
    http.Response response = await http.get(Uri.parse(url),headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    });

    return AllRelativeModel.fromJson(jsonDecode(response.body));
  }

  static deleteRelative(String s) async {
    var url = "${baseUrl}relative/delete/$s";

    http.Response response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization':
          'Bearer $token'
    });
    print(response.body);
    return jsonDecode(response.body);
  }

  static addNewRelative(
      String name,
      String date,
      String month,
      String year,
      String hour,
      String min,
      String meridian,
      int relationId,
      String place,
      gender,
      relation,
      placeId) async {

      final body = jsonEncode({

        "birthDetails":{
          "dobDay": date,
          "dobMonth": month,
          "dobYear": year,
          "tobHour": hour,
          "tobMin": min,
          "meridiem": meridian.toString()
        },
        "birthPlace": {
          "placeName": place.toString(),
          "placeId": placeId.toString()
        },
        "firstName": name.toString(),
        "lastName": "",
        "relationId": relationId,
        "gender": gender.toString()

      });
      Map<String,String> headers = {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      };

    // var url = "${baseUrl}relative";
    http.Response response = await http.post(Uri.https('staging-api.astrotak.com','/api/relative'), body: body,headers:headers);

    print(response.body);
    return jsonDecode(response.body);

  }

  static Future<CityModel> getCity(value) async {

    var url = "${baseUrl}location/place";
    final queryParameters = {
      'inputPlace': value.toString(),
    };

    http.Response response = await http.get(Uri.parse(url),headers: queryParameters);
    print(response);
    return CityModel.fromJson(jsonDecode(response.body));
  }
}
