import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamy/components/widget/profile.dart';
import 'package:teamy/database/study_map.dart';
import 'package:teamy/pages/main/detail_page.dart';
import 'package:teamy/pages/main/my_page.dart';
import 'package:teamy/theme/style.dart';
import 'package:teamy/utils/currency.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Widget _offlineStudy() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext _context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return DetailPage(studyData: studyOffline[index]);
              }));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Hero(
                      tag: studyOffline[index]["cid"]!,
                      child: Image.asset(
                        studyOffline[index]["imgUrl"]!,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              studyOffline[index]["name"]!,
                              style: TextStyle(
                                  letterSpacing: -1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              studyOffline[index]["mindesc"]!,
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: -1,
                                  color: headTextClr.withOpacity(0.7)),
                            ),
                            Text(
                                DataUtils.calcStringToWon(
                                    studyOffline[index]["price"]!),
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: -1,
                                  color: headTextClr,
                                )),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.location,
                                  size: 16,
                                ),
                                Text(
                                  studyOffline[index]["location"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.heart,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      studyOffline[index]["favorite"]!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.person_2,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      studyOffline[index]["members"]!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.chat_bubble,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      studyOffline[index]["ratings"]!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(
            height: 1,
            color: headTextClr.withOpacity(0.1),
          );
        },
        itemCount: studyOffline.length);
  }

  Widget _onlineStudy() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext _context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return DetailPage(studyData: studyOnline[index]);
              }));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Hero(
                      tag: studyOnline[index]["cid"]!,
                      child: Image.asset(
                        studyOnline[index]["imgUrl"]!,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              studyOnline[index]["name"]!,
                              style: TextStyle(
                                  letterSpacing: -1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              studyOnline[index]["mindesc"]!,
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: -1,
                                  color: headTextClr.withOpacity(0.7)),
                            ),
                            Text(
                                DataUtils.calcStringToWon(
                                    studyOnline[index]["price"]!),
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: -1,
                                  color: headTextClr,
                                )),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.location,
                                  size: 16,
                                ),
                                Text(
                                  studyOnline[index]["location"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.heart,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      studyOnline[index]["favorite"]!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.person_2,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      studyOnline[index]["members"]!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.chat_bubble,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      studyOnline[index]["ratings"]!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(
            height: 1,
            color: headTextClr.withOpacity(0.1),
          );
        },
        itemCount: studyOnline.length);
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: headTextClr),
        centerTitle: false,
        title: Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
          height: 33,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPage()));
                },
                child: UserProfileImage(
                  size: 55,
                  imgUrl:
                      'https://www.thenews.com.pk/assets/uploads/updates/2021-01-13/773676_9402039_294840_094028_updates_updates.jpg',
                )),
          )
        ],
        elevation: 0,
      ),
      body: Column(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 0, 15),
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '어른들의 스터디',
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: -2,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'TEAMMY🌟',
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: -2,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Container(
              child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), color: bluishClr),
                labelPadding: EdgeInsets.symmetric(horizontal: 30),
                controller: _tabController,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: headTextClr.withOpacity(0.6),
                indicatorColor: bluishClr,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: '오프라인',
                  ),
                  Tab(
                    text: '온라인',
                  ),
                ]),
          )),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: [_offlineStudy(), _onlineStudy()]),
        ),
      ]),
    );
  }
}
