import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamy/theme/style.dart';

class FavorPage extends StatefulWidget {
  const FavorPage({super.key});

  @override
  State<FavorPage> createState() => _FavorPageState();
}

class _FavorPageState extends State<FavorPage> {
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
                    '즐겨찾기',
                    style: TextStyle(
                        fontSize: 26,
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
