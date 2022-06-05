import 'package:astrodemo/screen/ask_question_screen.dart';
import 'package:astrodemo/screen/homescreen.dart';
import 'package:astrodemo/screen/reportscreen.dart';
import 'package:astrodemo/screen/talkscreen.dart';
import 'package:flutter/material.dart';
import 'package:astrodemo/screen/chatscreen.dart';

class BottomNavigationProvider with ChangeNotifier{
int currentIndex = 2;

List screenList = [
    const HomeScreen(),
    const TalkScreen(),
    const AskQuestionScreen(),
    const ReportScreen(),
    const ChatScreen(),
  ];


  changeScreenIndex(int index, BuildContext context) {
    currentIndex = index;
    navigateToBottomNavBar(currentIndex, context);
    notifyListeners();
  }

  navigateToBottomNavBar(int currentIndex, BuildContext context) async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => screenList[currentIndex]));
    notifyListeners();
  }

}