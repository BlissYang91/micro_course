import 'package:flutter/material.dart';

/// 将字符串表示的颜色改为16进制表示
class HexColor extends Color{

  static int _getColorFromHex(String hexColor){
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length == 6){
      hexColor = "FF"+hexColor;
    }
    return int.parse(hexColor,radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

}