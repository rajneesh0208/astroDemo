import 'package:astrodemo/provider/askquestionprovider.dart';
import 'package:astrodemo/provider/bottom_navigation_provider.dart';
import 'package:astrodemo/provider/cprofile_provider.dart';
import 'package:astrodemo/screen/ask_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
ChangeNotifierProvider(create: (_) => AskQuestionProvider()),
ChangeNotifierProvider(create: (_) => ProfileProvider()),
  ],
  child: const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "fantok",
    color: Colors.white,
    home: AskQuestionScreen(),
  ),
  ));
}
