import 'package:flutter/material.dart';

class BasicProfileScreen extends StatefulWidget {
  const BasicProfileScreen({Key? key}) : super(key: key);

  @override
  State<BasicProfileScreen> createState() => _BasicProfileScreenState();
}

class _BasicProfileScreenState extends State<BasicProfileScreen> {
  dynamic h,w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      margin: EdgeInsets.symmetric(horizontal: w * 0.05),
      child:Column(
        children: [
          Container(
            
          ),
        ],
      )
    );
  }
}
