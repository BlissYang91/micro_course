import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:micro_course/ui/CourseScreen.dart';
import 'package:micro_course/ui/MineScreen.dart';
import 'package:micro_course/ui/StudyScreen.dart';

class BottomNavigationWidget extends StatefulWidget{
  @override
  BottomNavigationWidgetState createState() {
    return BottomNavigationWidgetState();
  }

}

class BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  ///当前选中tab位置
  int _currentIndex = 0;
  List<Widget> list = List();
  var appBarTitles = ['选课',"学习","我的"];
  var tabImages;
  @override
  void initState() {
    list
     ..add(CourseScreen())
     ..add(StudyScreen())
     ..add(MineScreen());

    ///初始化底部导航栏选中和未选中的图片
    tabImages = [
      [getTabImage('images/icons/lesson_default.png'),getTabImage('images/icons/lesson_selected.png'),],
      [getTabImage('images/icons/personal_default.png'),getTabImage('images/icons/personal_selected.png'),],
      [getTabImage('images/icons/study_default.png'),getTabImage('images/icons/study_selected.png'),],
    ];

    super.initState();
  }

  ///获取底部导航栏的icon
  Image getTabImage(path){
    return new Image.asset(path,width: 25.0,height: 25.0,);
  }

  ///根据传入当前点击tab的位置curIndex确定当前icon样式是default还是selected,
  Image getTabIcon(int curIndex){
    if(curIndex == _currentIndex){
      ///    当前tab被选中
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  ///获取底部tab的文本内容和颜色样式
  Text getTabTitle(int curIndex){
    if(curIndex == _currentIndex){
      return new Text(
        appBarTitles[curIndex],
        style: TextStyle(fontSize: 13.0,color:Colors.black54),
      );
    }else{
      return new Text(
        appBarTitles[curIndex],
        style: TextStyle(fontSize: 13.0,color: Colors.grey[500]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: getTabIcon(0),title: getTabTitle(0),
            ),
            BottomNavigationBarItem(
              icon: getTabIcon(1),title: getTabTitle(1),
            ),
            BottomNavigationBarItem(
              icon: getTabIcon(2),title: getTabTitle(2),
            ),
          ],
        currentIndex: _currentIndex,
        onTap: (int index){
            setState(() {
              _currentIndex = index;
            });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

}