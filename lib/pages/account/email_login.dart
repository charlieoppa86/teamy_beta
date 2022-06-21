import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamy/app.dart';
import 'package:teamy/pages/account/email_auth.dart';
import 'package:teamy/pages/test/new_study_status.dart';
import 'package:teamy/theme/style.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({Key? key}) : super(key: key);

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailAuth>(builder: (context, emailAuth, child) {
      final user = emailAuth.currentUser();
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 220,
                    height: 120,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "이메일", hintText: "이메일을 입력해주세요"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "비밀번호", hintText: "비밀번호를 입력해주세요"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          emailAuth.signIn(
                            email: emailController.text,
                            password: passwordController.text,
                            onSuccess: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('로그인에 성공했습니다')));

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => App()));
                            },
                            onError: (error) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(error)));
                            },
                          );
                          print("로그인 유저가 있습니다");
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(bluishClr)),
                        child: Text('로그인',
                            style: TextStyle(
                              fontSize: 16,
                            )))),
                Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          emailAuth.signUp(
                              email: emailController.text,
                              password: passwordController.text,
                              onSuccess: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('회원가입에 성공했습니다')));
                              },
                              onError: (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error)));
                              });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(yelloishClr)),
                        child: Text('회원가입',
                            style: TextStyle(
                              fontSize: 16,
                            )))),
              ],
            ),
          ),
        ),
      );
    });
  }
}
