import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeMode get getThemeMode=>themeMode;

  int get getThemeIndex{
    if(themeMode==ThemeMode.light){
      return 0;
    }else if(themeMode==ThemeMode.dark){
      return 1;
    }else{
      return 2;
    }
  }

  void setThemeMode (int themeIndex){
    if(themeIndex==0){
      themeMode=ThemeMode.light;
    }else if(themeIndex==1){
      themeMode=ThemeMode.dark;
    } else{
      themeMode=ThemeMode.system;
    }
    notifyListeners();
  }
}