import 'package:astrodemo/model/all_relative_model.dart';
import 'package:astrodemo/model/city_model.dart';
import 'package:astrodemo/services/api.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  int? currentTab = 0;
  int? profileTab = 0;
  Data? relativeData;

  var deleteMessage;

  String amPm = "";
  List<Datum>? cityDetailList;

  var successMsg = "";

  bool updateStatus = false;

  String userUid ="";

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
    if (res.httpStatusCode == 200) {
      relativeData = res.data;
    }
    notifyListeners();
  }

  deleteRelative(String s) async {
    var res = await Api.deleteRelative(s);
    if (res["httpStatusCode"] == 200) {
      deleteMessage = res["message"];
    }
    notifyListeners();
  }

  void setAmPm(String s) {
    amPm = s;
    notifyListeners();
  }

  addNewRelative(String name, String date, String month, String year,
      String hour, String min,String meridian, int relationId, String place, gender, relation,placeId) async {
    var res = await Api.addNewRelative(name,date,month,year,hour,
    min,meridian,relationId,place,gender,relation,placeId);

    if(res['httpStatusCode'] == 200){
      successMsg = res['message'];
    }

    notifyListeners();
  }

  getCity(value) async {
    var res = await Api.getCity(value);
    cityDetailList = res.data;
    notifyListeners();
  }

  updateProfile(bool status, String uuid) {
    updateStatus = status;
    userUid = uuid;
    notifyListeners();
  }

}


