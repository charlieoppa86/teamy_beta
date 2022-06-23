import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:teamy/components/widget/text.dart';
import 'package:teamy/pages/account/email_auth.dart';
import 'package:teamy/pages/account/email_login.dart';
import 'package:teamy/theme/style.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  void _showLogoutDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('로그아웃'),
            content: const Text('정말 로그아웃 하시겠습니까?'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  text: '취소',
                  color: Colors.blue,
                  textSize: 18,
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  context.read<EmailAuth>().signOut();
                  print("유저가 로그아웃했습니다");
                  // 로그인 페이지로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLoginPage()),
                  );
                },
                child: TextWidget(
                  text: '확인',
                  color: Colors.red,
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        textSize: 18,
        isTitle: true,
      ),
      leading: Icon(icon),
      trailing: Icon(IconlyLight.arrowRight2),
      onTap: (() {
        onPressed();
      }),
    );
  }

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
              _listTiles(
                title: '계정 관리',
                icon: IconlyLight.profile,
                onPressed: () {},
              ),
              _listTiles(
                title: '서비스 이용 안내',
                icon: IconlyLight.document,
                onPressed: () {},
              ),
              _listTiles(
                title: '고객 센터',
                icon: IconlyLight.chat,
                onPressed: () {},
              ),
              Container(
                width: 350,
                height: 1,
                decoration: BoxDecoration(color: subTextClr.withOpacity(0.1)),
              ),
              SizedBox(
                height: 5,
              ),
              CupertinoButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  child: const Text(
                    '로그아웃',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ))
            ],
          ),
        ));
  }
}
