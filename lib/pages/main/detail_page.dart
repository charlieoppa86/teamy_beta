import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teamy/theme/style.dart';
import 'package:teamy/utils/currency.dart';

class DetailPage extends StatefulWidget {
  Map<String, String> studyData;

  DetailPage({super.key, required this.studyData});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Size size;
  bool isMyFavorite = false;

  @override
  void initState() {
    super.initState();
    isMyFavorite = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    size = MediaQuery.of(context).size;
  }

  Widget _channelSimpleInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.studyData["channel"]!,
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.location,
                    size: 18,
                  ),
                  Text(
                    widget.studyData["location"]!,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.studyData["favorite"]!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.person_2,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.studyData["members"]!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _channelDetailInfo() {
    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.studyData["category"]!,
              style: TextStyle(
                  fontSize: 15,
                  color: headTextClr.withOpacity(0.4),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.studyData["mindesc"]!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '인사말\n스터디 소개\n스터디원 조건\n기타 등등',
              style: TextStyle(fontSize: 16, height: 1.3),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _channelleader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '스터디 리더',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: size.width,
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: yelloishClr,
                      radius: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.studyData["leader"]!,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: headTextClr.withOpacity(0.8)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  widget.studyData["maxdesc"]!,
                  style: TextStyle(
                      fontSize: 16, color: headTextClr.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ]),
      ),
    );
  }

  Widget _channelMembers() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '멤버',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.studyData["members"]!,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: headTextClr.withOpacity(0.6)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  Widget _channelFeedback() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '평가',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.studyData["ratings"]!,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: headTextClr.withOpacity(0.6)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.studyData["comments"]!,
                style: TextStyle(
                    fontSize: 16, color: headTextClr.withOpacity(0.8)),
              ),
            ],
          ),
        ));
  }

  Widget _line() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 1,
        color: Colors.black.withOpacity(0.12),
      ),
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              child: Hero(
            tag: widget.studyData["cid"]!,
            child: Image.asset(
              widget.studyData["imgUrl"]!,
              width: size.width,
              fit: BoxFit.fill,
            ),
          )),
          _channelSimpleInfo(),
          _line(),
          _channelDetailInfo(),
          _line(),
          _channelleader(),
          _line(),
          _channelMembers(),
          _line(),
          _channelFeedback(),
          _line(),
        ],
      ),
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 90,
      width: size.width,
      child: Row(children: [
        GestureDetector(
            onTap: () {
              setState(() {
                isMyFavorite = !isMyFavorite;
                Get.snackbar(
                  widget.studyData["channel"]!,
                  "보관함에 추가되었어요!",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                );
              });
            },
            child: isMyFavorite
                ? Icon(CupertinoIcons.heart_fill, color: Colors.redAccent)
                : Icon(CupertinoIcons.heart)),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          width: 1,
          height: 40,
          color: Colors.grey.withOpacity(0.3),
        ),
        Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DataUtils.calcStringToWon(widget.studyData["price"]!),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: headTextClr.withOpacity(0.9)),
              ),
              Text(
                '1회 참가비',
                style: TextStyle(
                    fontSize: 12, color: headTextClr.withOpacity(0.7)),
              )
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              print('신청이 완료됐습니다');
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: bluishClr,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Center(
                child: Text(
                  '신청하기',
                  style: TextStyle(
                      color: lightBgClr,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          color: headTextClr,
          icon: Icon(CupertinoIcons.back, color: lightBgClr),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white.withAlpha(0),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.share),
              color: lightBgClr,
            ),
          ),
        ],
      ),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
