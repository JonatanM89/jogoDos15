import 'dart:io';
import 'package:jogo_do_quinze/config/ui.dart';
import 'package:jogo_do_quinze/pages/page_splash.dart';
import 'package:jogo_do_quinze/play_games.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // For play billing library 2.0 on Android, it is mandatory to call
  // [enablePendingPurchases](https://developer.android.com/reference/com/android/billingclient/api/BillingClient.Builder.html#enablependingpurchases)
  // as part of initializing the app.
  //_setTargetPlatformForDesktop();
  runApp(
    PlayGamesContainer(
      child: ConfigUiContainer(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = '15Puzzle';
    return _MyMaterialApp(title: title);
  }
}

/// Base class for all platforms, such as
/// [Platform.isIOS] or [Platform.isAndroid].
abstract class _MyPlatformApp extends StatelessWidget {
  final String title;

  _MyPlatformApp({@required this.title});
}

class _MyMaterialApp extends _MyPlatformApp {
  _MyMaterialApp({@required String title}) : super(title: title);

  @override
  Widget build(BuildContext context) {
    final ui = ConfigUiContainer.of(context);

    ThemeData applyDecor(ThemeData theme) => theme.copyWith(
          primaryColor: Colors.blue,
          accentColor: Color.fromRGBO(255, 182, 0, 1),
          accentIconTheme: theme.iconTheme.copyWith(color: Colors.black),
          dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          textTheme: theme.textTheme.apply(fontFamily: 'ManRope'),
          primaryTextTheme: theme.primaryTextTheme.apply(fontFamily: 'ManRope'),
          accentTextTheme: theme.accentTextTheme.apply(fontFamily: 'ManRope'),
        );

    final baseDarkTheme = applyDecor(ThemeData(
      brightness: Brightness.dark,
      canvasColor: Color(0xFF121212),
      backgroundColor: Color(0xFF121212),
      cardColor: Color(0xFF1E1E1E),
    ));
    final baseLightTheme = applyDecor(ThemeData.light());

    ThemeData darkTheme;
    ThemeData lightTheme;
    if (ui.useDarkTheme == null) {
      // auto
      darkTheme = baseDarkTheme;
      lightTheme = baseLightTheme;
    } else if (ui.useDarkTheme == true) {
      // dark
      darkTheme = baseDarkTheme;
      lightTheme = baseDarkTheme;
    } else {
      // light
      darkTheme = baseLightTheme;
      lightTheme = baseLightTheme;
    }

    return MaterialApp(
      title: title,
      darkTheme: darkTheme,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          bool useDarkTheme;
          if (ui.useDarkTheme == null) {
            var platformBrightness = MediaQuery.of(context).platformBrightness;
            useDarkTheme = platformBrightness == Brightness.dark;
          } else {
            useDarkTheme = ui.useDarkTheme;
          }
          final overlay = useDarkTheme
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark;
          SystemChrome.setSystemUIOverlayStyle(
            overlay.copyWith(
              statusBarColor: Colors.transparent,
            ),
          );
          return SplashPage();
        },
      ),
    );
  }
}
