import 'package:flutter/material.dart';
import 'package:micro_course/model/MyCourseBean.dart';
import 'package:micro_course/widgets/ItemMyCourseList.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class StudyScreen extends StatelessWidget {
  List<MyCourseBean> listCourse = List();

  @override
  Widget build(BuildContext context) {
    if (listCourse.length > 0) {
      listCourse.clear();
    }
    listCourse
      ..add(MyCourseBean('images/test/learning1.png', '5-6年级'))
      ..add(MyCourseBean('images/test/learning2.png', '4-5年级'))
      ..add(MyCourseBean('images/test/learning3.png', '1-2年级'))
      ..add(MyCourseBean('images/test/learning1.png', '2-3年级'));
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
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
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
                          Padding(
                            padding: EdgeInsets.only(left: 3),
                            child: Text(
                              '45',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
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
      final List<String> swiperList = [
        'images/test/carousel_1.png',
        'images/test/carousel_2.png',
      ];
      return SwiperDiy(swiperList: swiperList);
    } else if (index == 3) {
      /// 我的课程标题栏
      return couseTitleWigdet;
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

  /// 我的课程标题栏
  Widget couseTitleWigdet = Container(
    height: 45,
    child: Padding(
      padding: EdgeInsets.fromLTRB(15,10,15,10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 4,
            height: 20,
            color: Colors.yellow,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              '我的课程',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black54),
            ),
          )
        ],
      ),
    ),
  );
}

/// 轮播图
class SwiperDiy extends StatelessWidget {
  final List<String> swiperList;

  SwiperDiy({Key key, this.swiperList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Container(
        height: 90,
        child: Swiper(
          itemCount: swiperList.length,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              ///          设置指示器颜色
              color: Colors.white,
              activeColor: Colors.blueAccent,
            ),
          ),
          autoplay: true,
          onTap: (index) {
            return Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("点击了:$index")));
          },
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              swiperList[index],
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}
