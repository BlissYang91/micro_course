import 'package:flutter/material.dart';
import 'package:micro_course/model/MyCourseBean.dart';

class ItemMyCourseList extends StatefulWidget{
  MyCourseBean bean;
  ItemMyCourseList({this.bean});
  @override
  ItemMyCourseListState createState() {
    return ItemMyCourseListState();
  }

}

class ItemMyCourseListState extends State<ItemMyCourseList>{
  @override
  Widget build(BuildContext context) {
    var item = widget.bean;
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(content:  Text('点击$item.grade'),));
      },
      child: Text(
        item.grade
      ),
    );
  }

}