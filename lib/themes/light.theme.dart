import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color.fromRGBO(47, 46, 46, 1);
const lightColor = const Color(0xFFFFFFFF);
const backgroundColor = const Color(0xFFF5F5F5);

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primarySwatch: Colors.red,
    brightness: brightness,
    textTheme: new TextTheme(
        body1: new TextStyle(color: Colors.black),
        display4: new TextStyle(fontSize: 78),
        button: new TextStyle(color: Colors.green),
        headline: new TextStyle(color: Colors.deepPurple)),
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    // appBarTheme:
    // bottomAppBarTheme:
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromRGBO(249, 151, 106, 1),
      height: 50,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: Color.fromRGBO(249, 151, 106, 1))),
    ),
    // cardTheme: CardTheme(
    //   elevation: 5,
    //   color: Colors.indigo,
    // ),
    // chipTheme:
    // dialogTheme:
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(59, 182, 123, 1),
    ),
    // iconTheme:
    //inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    primaryColor: primaryColor,
    accentColor: Colors.black,
    // fontFamily: 'Montserrat',
    // buttonColor: Color(0xFF00C569),
    // cardColor: Colors.white,
  );
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
