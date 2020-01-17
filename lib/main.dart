import 'package:flutter/material.dart';
import 'package:micro_course/common/Common.dart';
import 'package:micro_course/common/RouterConfig.dart';
import 'package:micro_course/ui/HomeScreen.dart';
import 'package:micro_course/utils/theme_util.dart';
import 'package:micro_course/widgets/BottomNavigationWidget.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

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
    initWX();
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeUtil.getThemeData(),
      routes: Router.generateRoute(),
      home: BottomNavigationWidget(),
    );
  }

  void initWX() async{
    await fluwx.registerWxApi(
        appId:"wx1b9954566c289124",
        doOnAndroid: true,
        doOnIOS: true,
        universalLink:"https://www.kuaizaixuetang.com/"

    );
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }

}
