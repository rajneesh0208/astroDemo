import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  int? currentTab = 0;
  int? profileTab = 0;


  defaultTab(int i) {
    currentTab = i;
    notifyListeners();
  }

  void setTab(int i) {
    profileTab = i;
    notifyListeners();
  }

}


