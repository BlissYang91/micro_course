import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:micro_course/utils/HexColor.dart';

class MineScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心',),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz,color: Colors.grey,), onPressed: (){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('点击分享')));
          })
        ],
      ),
      body: ListView(
        children: <Widget>[
          headerWidget,
        ],
      )
    );
  }
  Widget headerWidget = Container(
    height: 205,
    color: Colors.yellow[600],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow[800],width: 1),
            borderRadius: BorderRadius.circular(42)
          ),
          child:ClipOval(
            child: Image.asset(
              'images/avatar.png',
              width: 83,
              height: 83,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'Bliss',
            style: TextStyle(fontSize: 18.0,color: HexColor("#824E00"),fontWeight: FontWeight.w500),
          ),
        )

      ],
    ),
  );
}