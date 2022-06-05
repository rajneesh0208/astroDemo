import 'package:astrodemo/customwidgets/colorconstant.dart';
import 'package:astrodemo/provider/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationProvider bottomNavigationProvider =
        Provider.of(context, listen: false);

    return Container(
      height: 60,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Column(
              children: [
                Image.asset("assets/home.png",
                    width: 28,
                    color: bottomNavigationProvider.currentIndex == 0
                        ? ColorConstant.splashYellow
                        : ColorConstant.bottomGrey),
                Text(
                  "Home",
                  style: TextStyle(
                      color: bottomNavigationProvider.currentIndex == 0
                          ? ColorConstant.splashYellow
                          : ColorConstant.bottomGrey),
                ),
              ],
            ),
            onTap: () async {
              await bottomNavigationProvider.changeScreenIndex(0, context);
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                Image.asset(
                  "assets/talk.png",
                  width: 28,
                  color: bottomNavigationProvider.currentIndex == 1
                      ? ColorConstant.splashYellow
                      : ColorConstant.bottomGrey,
                ),
                Text(
                  "Talk",
                  style: TextStyle(
                      color: bottomNavigationProvider.currentIndex == 1
                          ? ColorConstant.splashYellow
                          : ColorConstant.bottomGrey),
                ),
              ],
            ),
            onTap: () async {
              await bottomNavigationProvider.changeScreenIndex(1, context);
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                Image.asset(
                  "assets/ask.png",
                  width: 28,
                  color: bottomNavigationProvider.currentIndex == 2
                      ? ColorConstant.splashYellow
                      : ColorConstant.bottomGrey,
                ),
                Text(
                  "Ask Question",
                  style: TextStyle(
                      color: bottomNavigationProvider.currentIndex == 2
                          ? ColorConstant.splashYellow
                          : ColorConstant.bottomGrey),
                ),
              ],
            ),
            onTap: () async {
              await bottomNavigationProvider.changeScreenIndex(2, context);
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                Image.asset(
                  "assets/reports.png",
                  width: 28,
                  color: bottomNavigationProvider.currentIndex == 3
                      ? ColorConstant.splashYellow
                      : ColorConstant.bottomGrey,
                ),
                Text(
                  "Reports",
                  style: TextStyle(
                      color: bottomNavigationProvider.currentIndex == 3
                          ? ColorConstant.splashYellow
                          : ColorConstant.bottomGrey),
                ),
              ],
            ),
            onTap: () async {
              await bottomNavigationProvider.changeScreenIndex(3, context);
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                Image.asset(
                  "assets/chat.png",
                  width: 28,
                  color: bottomNavigationProvider.currentIndex == 4
                      ? ColorConstant.splashYellow
                      : ColorConstant.bottomGrey,
                ),
                Text(
                  "Chat",
                  style: TextStyle(
                      color: bottomNavigationProvider.currentIndex == 4
                          ? ColorConstant.splashYellow
                          : ColorConstant.bottomGrey),
                ),
              ],
            ),
            onTap: () async {
              await bottomNavigationProvider.changeScreenIndex(4, context);
            },
          ),
        ],
      ),
    );
  }
}
