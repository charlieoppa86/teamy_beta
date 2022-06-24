import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavorBTN extends StatefulWidget {
  const FavorBTN({super.key});

  @override
  State<FavorBTN> createState() => _FavorBTNState();
}

class _FavorBTNState extends State<FavorBTN> {
  @override
  Widget build(BuildContext context) {
    bool isMyFavorite = false;
    int favoriteItemCount = 0;

    @override
    void initState() {
      super.initState();
      isMyFavorite = false;
    }

    return GestureDetector(
        onTap: () {
          setState(() {
            if (isMyFavorite) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('즐겨찾기를 삭제됐습니다')));
              favoriteItemCount -= 1;
              isMyFavorite = false;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('즐겨찾기에 추가됐습니다')));
              favoriteItemCount += 1;
              isMyFavorite = true;
            }
          });
        },
        child: isMyFavorite
            ? Icon(CupertinoIcons.heart_fill, color: Colors.redAccent)
            : Icon(CupertinoIcons.heart));
  }
}
