import 'package:astrodemo/model/ask_question_model.dart';
import 'package:astrodemo/services/api.dart';
import 'package:flutter/material.dart';

class AskQuestionProvider with ChangeNotifier {
  List<Data>? dataList;

  List<String>? suggestionList;



  getAskQuestionData() async {
    var res = await Api.getAskQuestion();
    if (res.httpStatusCode == 200) {
      dataList = res.data;
      notifyListeners();
    }
  }

   categoryId(var newValue) async{
    for (var i = 0; i < dataList!.length; i++) {
      if (dataList![i].id == newValue) {
        suggestionList = dataList![i].suggestions;
      }
    }
notifyListeners();
  }
}
