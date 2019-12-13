import 'package:flutter/material.dart';

class ThemeUtil{
  /// 默认主题色
  static const Color defaultColor = Colors.redAccent;

  /// 当前的主题色
  static Color currentThemeColor = defaultColor;

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