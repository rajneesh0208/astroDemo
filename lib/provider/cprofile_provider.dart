
import 'package:astrodemo/model/all_relative_model.dart';
import 'package:astrodemo/services/api.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  int? currentTab = 0;
  int? profileTab = 0;
  Data? relativeData;

  var deleteMessage;

  String amPm = "";


  defaultTab(int i) {
    currentTab = i;
    notifyListeners();
  }

  void setTab(int i) {
    profileTab = i;
    notifyListeners();
  }

  getAllRelativeData() async {
    var res = await Api.getAllRelativeData();
    if(res.httpStatusCode == 200){
      relativeData = res.data;
    }
    notifyListeners();
  }

  deleteRelative(String s) async {
    var res = await Api.deleteRelative(s);
    if(res["httpStatusCode"] == 200){
      deleteMessage = res["message"];
    }
    notifyListeners();
  }

  void setAmPm(String s) {
  amPm = s;
    notifyListeners();
  }



}


