import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('选课'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz,color: Colors.grey,), onPressed: (){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('点击分享')));
          })
        ],
      ),
      body: Center(
        child: Text('选课页面'),
      ),
    );
  }

}