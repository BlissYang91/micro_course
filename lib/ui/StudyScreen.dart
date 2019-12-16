import 'package:flutter/material.dart';
import 'package:micro_course/model/MyCourseBean.dart';
import 'package:micro_course/widgets/ItemMyCourseList.dart';

class StudyScreen extends StatelessWidget {
  List<MyCourseBean> listCourse = List();

  @override
  Widget build(BuildContext context) {
    if(listCourse.length>0){
      listCourse.clear();
    }
    listCourse
      ..add(MyCourseBean('images/test/learning1', '5-6年级'))
      ..add(MyCourseBean('images/test/learning2', '4-5年级'))
      ..add(MyCourseBean('images/test/learning3', '1-2年级'))
      ..add(MyCourseBean('images/test/learning1', '2-3年级'));
    return Scaffold(
      appBar: AppBar(
        title: Text('学习'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
              onPressed: () {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('点击分享')));
              })
        ],
      ),

      /// 标准的ListView构造函数适用于小列表。 为了处理包含大量数据的列表，最好使用ListView.builder构造函数。
      body: ListView.builder(
        itemBuilder: itemView,
        itemCount: listCourse.length + 3,

        /// list里面的内容不足一屏时也可以滑动
        physics: AlwaysScrollableScrollPhysics(),
      ),
    );
  }

  Widget titleWidget = Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ClipOval(
                    child: Image.asset(
                      'images/test/logo_mine.jpeg',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Bliss',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Image.asset(
                'images/dyy/icon_coin.png',
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(left: 3),child: Text(
                '0',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),),

              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'images/dyy/icon_luobu.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                          Padding(padding: EdgeInsets.only(left: 3),child: Text(
                            '45',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),)

                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      ));

  Widget carouselWidget = Row(
    children: <Widget>[
      Text('轮播'),
    ],
  );

  ///ListView 中每一行的视图
  Widget itemView(BuildContext context, int index) {
    if (index == 0) {
      /// 标题栏
      return titleWidget;
    } else if (index == 1) {
      /// 分割线
      return dividerWidget;
    } else if (index == 2) {
      ///轮播图
      return carouselWidget;
    }
    MyCourseBean item = listCourse[index - 3];
    return ItemMyCourseList(
      bean: item,
    );
  }

  Widget dividerWidget = Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  );
}
