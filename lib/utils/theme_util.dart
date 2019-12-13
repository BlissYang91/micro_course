import 'package:flutter/material.dart';

class ThemeUtil{
  /// 当前的主题色
  static Color currentThemeColor = Colors.redAccent;

  static ThemeData getThemeData(){
    return new ThemeData(
      brightness: Brightness.light,
      primaryColor: currentThemeColor,
      primaryColorDark: currentThemeColor,
      accentColor: currentThemeColor,
      dividerColor: Color(0x1F000000),
    );
  }
}