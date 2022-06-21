import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        centerTitle: false,
        actionsIconTheme: IconThemeData(color: headTextClr)),
    textTheme: GoogleFonts.getTextTheme("IBM Plex Sans KR"));

const Color bluishClr = Color(0xFF055CF5);
const Color yelloishClr = Color(0xFFFFB746);
const Color darkBgClr = Color(0xFF1A1C1E);
const Color lightBgClr = Color(0xFFE9E9E9);
const Color headTextClr = Color(0xFF424242);
const Color subTextClr = Color(0xFF7A7A7A);
