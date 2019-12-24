import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_course/model/MyCourseBean.dart';
import 'package:micro_course/utils/HexColor.dart';

class ItemMyCourseList extends StatefulWidget {
  MyCourseBean bean;

  ItemMyCourseList({this.bean});

  @override
  ItemMyCourseListState createState() {
    return ItemMyCourseListState();
  }
}

class ItemMyCourseListState extends State<ItemMyCourseList> {
  @override
  Widget build(BuildContext context) {
    var item = widget.bean;
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('点击$item.grade'),
        ));
      },
      child: Container(
          color: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.fromLTRB(15,15,15,0),
          ///圆角卡片布局
            child: SizedBox(
              height: 240,
              child: Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
//                        Image.asset(item.imgUrl,fit: BoxFit.fill,height: 143),
                       Container(
                         height: 140,
                         width: 580,
                         decoration: BoxDecoration(
                           image: DecorationImage(
                             image: AssetImage(item.imgUrl),
                             fit: BoxFit.fitWidth,
                           ),
                           borderRadius: BorderRadius.vertical(
                             ///顶部圆角
                             top: Radius.circular(10.0),
                           ),
                         ),
                       ),
                        Text(
                          item.grade+'新',

                        ),
//                        Image.asset("images/distribution/studing.png"),
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(7.5, 0, 7.5, 0),child:  Container(
                      height: 89,
                      color: Colors.white,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(45)),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 325,
                            decoration: BoxDecoration(
                              color: Colors.yellow[800],
                              borderRadius: BorderRadius.all(Radius.circular(45)),
                            ),
                          ),
                          Text(
                            '开始学习',
                            style: TextStyle(fontSize: 18,color: HexColor('#824E00')),
                          ),
                        ],
                      ),
                    ), )

                  ],
                ),
              ),
            ),
          )),
    );
  }
}
