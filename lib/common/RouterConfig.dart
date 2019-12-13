import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:micro_course/ui/SplashScreen.dart';
import 'package:micro_course/ui/CourseScreen.dart';
import 'package:micro_course/ui/MineScreen.dart';
import 'package:micro_course/ui/StudyScreen.dart';

class RouterName{
  static const String splash = 'splash';
  static const String mine = 'mine';
  static const String course = 'course';
  static const String study = 'study';
}

class Router{
  static Map<String,WidgetBuilder> generateRoute(){
    Map<String,WidgetBuilder> routes = {
      RouterName.splash:(context) => SplashScreen(),
      RouterName.course:(context) => CourseScreen(),
      RouterName.study:(context) => StudyScreen(),
      RouterName.mine:(context) => MineScreen(),
    };
    return routes;
  }
}