import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color.fromRGBO(47, 46, 46, 1);
const lightColor = const Color(0xFFFFFFFF);
const backgroundColor = const Color.fromRGBO(50, 56, 89, 1);
const secundaryColor = const Color.fromRGBO(249, 151, 106, 1);

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primarySwatch: Colors.red,
    brightness: brightness,
    textTheme: new TextTheme(
        body1: new TextStyle(color: Colors.white60),
        display4: new TextStyle(fontSize: 78),
        button: new TextStyle(color: Colors.green),
        title: new TextStyle(color: Colors.white),
        headline: new TextStyle(color: Colors.deepPurple)),
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    appBarTheme: AppBarTheme(color: Color.fromRGBO(25, 28, 44, 1)),
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromRGBO(255, 104, 87, 1),
      height: 50,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: Color.fromRGBO(255, 104, 87, 1))),
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
    iconTheme: IconThemeData(color: Colors.white),
    //inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    primaryColor: primaryColor,
    accentColor: Colors.white,
    // fontFamily: 'Montserrat',
    // buttonColor: Color(0xFF00C569),
    // cardColor: Colors.white,
  );
}
