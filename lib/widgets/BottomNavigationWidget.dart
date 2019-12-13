import 'package:flutter/material.dart';
import 'package:micro_course/ui/CourseScreen.dart';
import 'package:micro_course/ui/MineScreen.dart';
import 'package:micro_course/ui/StudyScreen.dart';

class BottomNavigationWidget extends StatefulWidget{
  @override
  BottomNavigationWidgetState createState() {
    // TODO: implement createState
    return BottomNavigationWidgetState();
  }

}

class BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
     ..add(CourseScreen())
     ..add(StudyScreen())
     ..add(MineScreen());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: list[_currentIndex],
//      bottomNavigationBar: BottomAppBar(
//        child: Row(
//          children: <Widget>[
//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Image.asset('images/icons/lesson_selected.png'),
//                Text('选课')
//              ],
//            ),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Image.asset('images/icons/personal_default.png'),
//                Text('学习')
//              ],
//
//            ),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Image.asset('images/icons/study_default.png'),
//                Text('我的')
//              ],
//            ),
//          ],
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//        ),
//      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.home,
//                  color: _bottomNavigationColor,
//                ),
              icon:Image.asset('images/icons/lesson_selected.png',width: 20.0,height: 20.0,),
              title: Text(
                'Home',
                style: TextStyle(color: _bottomNavigationColor),
              )
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icons/personal_default.png',width: 20.0,height: 20.0,),
              title: Text(
                'Email',
                style: TextStyle(color: _bottomNavigationColor),
              ),

            ),
            BottomNavigationBarItem(
                icon: Image.asset('images/icons/study_default.png',width: 20.0,height: 20.0,),
                title: Text(
                  'Airplay',
                  style: TextStyle(color: _bottomNavigationColor),
                )

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