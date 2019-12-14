import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:micro_course/utils/HexColor.dart';

class MineScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
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
//          itemWidget,
          dividerWidget,
          buildListTile(context,'我的订单'),
          buildListTile(context,'我的拼团'),
          buildListTile(context,'我的班主任'),
          buildListTile(context,'学习时间提醒'),
          dividerWidget,
          buildListTile(context,'我的券包'),
          buildMultItem(context,'兑换好礼','images/dyy/icon_coin.png',0),
        ],
      )
    );
  }
  /// 兑换好礼item样式
  Widget buildMultItem(BuildContext context ,String item,String path,int num){
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('点击$item')));
      },
      child: Container(
        padding:  EdgeInsets.only(left: 10),
        height: 54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 16,color: Colors.black54),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset(path,width: 20,height:20,fit: BoxFit.contain,),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          num.toString(),
                          style: TextStyle(fontSize: 12,color: Colors.grey),
                        ),
                      ),

                      Icon(Icons.navigate_next,color: Colors.grey,),
                    ],
                  ),
                ),
              ],
            ),
            Container(width: double.infinity,height: 0.5,color: Colors.grey[300],)
          ],
        ),
      ),
    );
  }
  /// 单个item构建
  Widget buildListTile(BuildContext context,String item){
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('点击$item')));
      },
      child: Container(
        padding:  EdgeInsets.only(left: 10),
        height: 54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 16,color: Colors.black54),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.navigate_next,color: Colors.grey,),
                )

              ],
            ),
            Container(width: double.infinity,height: 0.5,color: Colors.grey[300],)
          ],
        ),
      ),
    );

  }

  ///头部组件
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
            border: Border.all(color: Colors.orange[400],width: 1),
            borderRadius: BorderRadius.circular(42)
          ),
          child:ClipOval(
            child: Image.asset(
//              'images/avatar.png',
              'images/test/logo_mine.jpeg',
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

  /// 模块分割线组件
  Widget dividerWidget = Container(
    width: double.infinity,height: 15,color: Colors.grey[200],
  );
}