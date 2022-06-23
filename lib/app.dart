import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withOpacity(0.9),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                  currentIndex == 0 ? IconlyBold.user3 : IconlyLight.user3),
              label: '스터디'),
          BottomNavigationBarItem(
              icon: Icon(
                  currentIndex == 1 ? IconlyBold.heart : IconlyLight.heart),
              label: '즐겨찾기'),
          BottomNavigationBarItem(
              icon: Icon(currentIndex == 2
                  ? IconlyBold.editSquare
                  : IconlyLight.editSquare),
              label: '관리'),
          BottomNavigationBarItem(
              icon:
                  Icon(currentIndex == 3 ? IconlyBold.plus : IconlyLight.plus),
              label: '새 스터디'),
        ],
      ),
    );
  }
}
