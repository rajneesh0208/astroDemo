import 'package:flutter/material.dart';

class CustomWidget{

  textWidget(String s, Color col, double fSize) {
    return Text(
      s,
      style: TextStyle(
        color: col,
        fontSize: fSize,
      ),
    );
  }

}