import 'dart:io';

import 'package:flutter/material.dart';
import 'package:micro_course/common/Common.dart';
import 'package:micro_course/common/RouterConfig.dart';
import 'package:micro_course/ui/HomeScreen.dart';
import 'package:micro_course/utils/theme_util.dart';
import 'package:micro_course/widgets/BottomNavigationWidget.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
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
