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
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),

            ///圆角卡片布局
            child: SizedBox(
              height: 240,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: <Widget>[
                    Stack(
//                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 110, 0, 0),
                          child: Stack(
                            alignment: AlignmentDirectional.centerStart,
                            children: <Widget>[
                              Opacity(
                                opacity: 0.2,
                                child: Container(
                                  height: 20,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(
                                        color: Colors.grey, width: 3.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  item.grade ,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 53),
                                child:  Container(
                                  height: 14,
                                  width: 14,
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                  ),
//                                  child: Padding(
//                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '新',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),

                                  ),
//                                ),
                              )

                            ],
                          ),
                        ),

//                        Image.asset("images/distribution/studing.png"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7.5, 0, 7.5, 0),
                      child: Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                              ),
                            ),
                            Text(
                              '开始学习',
                              style: TextStyle(
                                  fontSize: 18, color: HexColor('#824E00')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
