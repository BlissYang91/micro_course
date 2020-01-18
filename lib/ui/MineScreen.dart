import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:micro_course/bean/LoginMsg.dart';
import 'package:micro_course/bean/user.dart';
import 'package:micro_course/common/Common.dart';
import 'package:micro_course/common/eventbus.dart';
import 'package:micro_course/http/APIConfig.dart';
import 'package:micro_course/http/DioManger.dart';
import 'package:micro_course/utils/HexColor.dart';
import 'package:micro_course/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MineScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineScreenState();
  }
}

class _MineScreenState extends State<MineScreen> {
  bool need_login = true;

  @override
  void initState() {
    print("init执行");
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///总线 监听登录信息的回调
    bus.on('login', (arg) {
      print("我的页面 获取登录后用户信息：$arg");
      setState(() {
        need_login = false;

        ///隐藏键盘
        FocusScope.of(context).requestFocus(FocusNode());
      });
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '个人中心',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black87),
          ),
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
        body: ListView(
          children: <Widget>[
            loginMine(context),
            loginSuccess(context),
          ],
        ));
  }

  /// 登录成功显示个人中心
  Widget loginSuccess(BuildContext context) {
    return Offstage(
      offstage: need_login,
      child: Column(
        children: <Widget>[
          headerWidget,
          dividerWidget,
          buildListTile(context, '我的订单'),
          buildListTile(context, '我的拼团'),
          buildListTile(context, '我的班主任'),
          buildListTile(context, '学习时间提醒'),
          dividerWidget,
          buildListTile(context, '我的券包'),
          buildMultItem(context, '兑换好礼', 'images/dyy/icon_coin.png', 0),
          logoutWidget(context),
        ],
      ),
    );
  }

  /// 兑换好礼item样式
  Widget buildMultItem(
      BuildContext context, String item, String path, int num) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('点击$item')));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  item,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                )),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        path,
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          num.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }

  /// 单个item构建
  Widget buildListTile(BuildContext context, String item) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('点击$item')));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  item,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                )),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }

  ///退出组件
  Widget logoutWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("退出登录");
        need_login = true;
        SpUtil.clear();
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.all(10),
        child: Text(
          "退出",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black54,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  ///头部组件
  Widget headerWidget = Container(
    height: 205,
    width: double.infinity,
    color: Colors.yellow[600],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange[400], width: 1),
              borderRadius: BorderRadius.circular(42)),
          child: ClipOval(
            child: Image.asset(
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
            style: TextStyle(
                fontSize: 18.0,
                color: HexColor("#824E00"),
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );

  /// 模块分割线组件
  Widget dividerWidget = Container(
    width: double.infinity,
    height: 15,
    color: Colors.grey[200],
  );

  Widget loginMine(BuildContext context) {
    return Offstage(
      offstage: !need_login, //false表示显示当前widget
      child: Container(
        alignment: AlignmentDirectional.center,
        child: LoginWidget(),
      ),
    );
  }

  void getToken() async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    SpUtil.clear();
    LoginMsg loginMsg =
        SpUtil.getObj(Constants.keyUserModel, (v) => LoginMsg.fromJson(v));
    print("获取本地用户信息：" + loginMsg.toString());
    if(loginMsg != null){

      setState(() {
        need_login = false;
      });

      getUserInfo(loginMsg);
    }

  }

  /**
   * 获取平台用户信息
   */
  void getUserInfo(LoginMsg loginMsg)  async{
    print("取值测试："+ loginMsg.data.studentId.toString());
    ///显示指定Map的限定类型
    Map<String, String> parms = {
      "student_id": loginMsg.data.studentId.toString()
    };
    FormData formData = FormData.fromMap(parms);

    Map<String, String> headers = {
      "token": loginMsg.data.loginToken.toString()
    };
    var res = await DioManger.getInstance().dio.post(APIConfig.GET_USER_INFO,
        data: formData, queryParameters: headers);
    print("res == " + res.toString());
    User user = User.fromJson(json.decode(res.toString()));
    print("user == " + user.toString());
    if (user.code == 0) {
      setState(() {
        need_login = false;
      });
    }
  }
}
