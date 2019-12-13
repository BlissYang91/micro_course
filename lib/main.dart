import 'package:flutter/material.dart';
import 'package:micro_course/common/Common.dart';
import 'package:micro_course/common/RouterConfig.dart';
import 'package:micro_course/ui/HomeScreen.dart';
import 'package:micro_course/utils/theme_util.dart';
import 'package:micro_course/widgets/BottomNavigationWidget.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  MyAppState createState() {
    return new MyAppState();
  }

}
class MyAppState extends State<MyApp>{
  @override
  void setState(fn) {
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeUtil.getThemeData(),
      routes: Router.generateRoute(),
      home: BottomNavigationWidget(),
//      home: HomeScreen(),
    );
  }

}
