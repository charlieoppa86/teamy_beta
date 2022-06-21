import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamy/pages/account/email_auth.dart';
import 'package:teamy/pages/account/email_login.dart';
import 'package:teamy/theme/style.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: headTextClr),
          centerTitle: false,
          title: Text(
            '내 정보',
            style: TextStyle(
                color: headTextClr,
                fontWeight: FontWeight.bold,
                letterSpacing: -1),
          ),
          actions: [],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.person,
                    color: headTextClr,
                    size: 28,
                  ),
                  Container(
                    width: 12,
                  ),
                  Text(
                    '계정 관리',
                    style: TextStyle(
                      color: headTextClr,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 1,
                decoration: BoxDecoration(color: subTextClr.withOpacity(0.1)),
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.question_circle,
                    color: headTextClr,
                    size: 28,
                  ),
                  Container(
                    width: 12,
                  ),
                  Text(
                    '서비스 이용 안내',
                    style: TextStyle(
                      color: headTextClr,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 1,
                decoration: BoxDecoration(color: subTextClr.withOpacity(0.1)),
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.phone_circle,
                    color: headTextClr,
                    size: 28,
                  ),
                  Container(
                    width: 12,
                  ),
                  Text(
                    '고객센터',
                    style: TextStyle(
                      color: headTextClr,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 1,
                decoration: BoxDecoration(color: subTextClr.withOpacity(0.1)),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () async {
                  context.read<EmailAuth>().signOut();
                  print("유저가 로그아웃했습니다");
                  // 로그인 페이지로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLoginPage()),
                  );
                },
                child: const Text('로그아웃',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
              ),
            ],
          ),
        ));
  }
}
