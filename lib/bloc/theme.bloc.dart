import 'package:flutter/cupertino.dart';
import 'package:jogo_do_quinze/models/configs.model.dart';
import 'package:jogo_do_quinze/themes/dark.theme.dart';
import 'package:jogo_do_quinze/themes/light.theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(bool option) {
    switch (option) {
      case false:
        theme = lightTheme();
        GlobalConfigs.darkTheme = false;
        notifyListeners();
        break;

      case true:
        theme = darkTheme();
        GlobalConfigs.darkTheme = true;
        notifyListeners();
        break;

      default:
    }
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getBool('theme');
    GlobalConfigs.darkTheme = theme;
    change(GlobalConfigs.darkTheme);
  }
}
