import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';

ThemeData lightmode=ThemeData(
    primarySwatch:myColor,
   floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        iconTheme:IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle:SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
      titleTextStyle: TextStyle(
          fontFamily: "Jannah",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor:myColor,
      elevation: 200,
        //backgroundColor: Colors.cyan
    ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.black
    ),
    subtitle1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.black,
      height: 1.3
    ),
  ),
  fontFamily: "Jannah",
);