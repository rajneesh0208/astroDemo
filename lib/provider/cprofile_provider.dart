import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  int? currentTab = 0;


   defaultTab(int i)  {
     currentTab = i;
     notifyListeners();
   }




}