import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamy/theme/style.dart';

class ManagePage extends StatefulWidget {
  ManagePage({Key? key}) : super(key: key);

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: headTextClr),
        centerTitle: false,
        title: Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
          height: 33,
        ),
        actions: [],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '스터디 관리',
                    style: TextStyle(
                        fontSize: 24,
                        letterSpacing: -2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
