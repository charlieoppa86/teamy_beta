import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teamy/pages/main/new_study.dart';
import 'package:teamy/pages/main/favor_page.dart';
import 'package:teamy/pages/main/home_page.dart';
import 'package:teamy/pages/main/mng_page.dart';
import 'package:teamy/theme/style.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List pages = [
    HomePage(),
    FavorPage(),
    ManagePage(),
    NewStudyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        selectedItemColor: bluishClr,
        elevation: 0,
        unselectedItemColor: subTextClr,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withOpacity(0.9),
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_grid_2x2), label: "스터디"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "즐겨찾기"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.rectangle_stack), label: "스터디 관리"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.plus_square), label: "새 스터디"),
        ],
      ),
    );
  }
}
