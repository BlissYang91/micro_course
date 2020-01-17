import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:micro_course/common/eventbus.dart';
import 'package:micro_course/http/APIConfig.dart';
import 'package:micro_course/http/DioManger.dart';
import 'package:micro_course/utils/HexColor.dart';
import 'package:micro_course/widgets/login.dart';
import 'package:micro_course/bean/LoginMsg.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class MineScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineScreenState();
  }
}

class _MineScreenState extends State<MineScreen> {
  bool need_login = true;
  @override
  Widget build(BuildContext context) {
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

  final phoneController = TextEditingController();
  final pwdController = TextEditingController();

  Widget loginMine(BuildContext context) {
    return Offstage(
      offstage: !need_login,
      child: Container(
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 32.0, 30.0, 0),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage("images/course_logo.png"),
                  width: 139,
                  height: 38,
                  fit: BoxFit.contain,
                ),
                inputPhone(context),
                inputPassword(context),
                loginWidget(context),
                loginByWX(context),
              ],
            ),
          )),
    );
  }

  ///手机号模块
  Widget inputPhone(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Container(
        height: 50,
        width: 307,
        padding: EdgeInsets.only(left: 10.0),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        child: TextField(
//          autofocus: true,
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "请输入手机号",
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (v) {
//                      print("手机号:$v");
          },
        ),
      ),
    );
  }

  /// 密码模块
  Widget inputPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: 50,
        width: 307,
        padding: EdgeInsets.only(left: 10.0),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        child: TextField(
//          autofocus: true,
          controller: pwdController,
          decoration: InputDecoration(
            hintText: "请输入密码",
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (v) {
//                      print("密码:$v");
          },
        ),
      ),
    );
  }

  /// 手机号登录模块
  Widget loginWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var params = {
          "phone": phoneController.text,
          "password": pwdController.text,
        };
        login(params, context);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(7.5, 0, 7.5, 0),
        child: Container(
          height: 120,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 307,
                decoration: BoxDecoration(
                  color: Colors.yellow[800],
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
              ),
              Text(
                '登录',
                style: TextStyle(fontSize: 18, color: HexColor('#824E00')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 微信登录模块
  Widget loginByWX(BuildContext context) {
    return GestureDetector(
      onTap: loginWX,
      child: Container(
//        height: 50,
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Image(
            image: AssetImage("images/send.png"),
            width: 139,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void login(Map<String, String> params, BuildContext context) {
    DioManger.getInstance().post(APIConfig.LOGIN, params, null, (data) {
      setState(() {
        print("登录成功：" + data.toString());
        Map<String, dynamic> jsonMsg = json.decode(data.toString());
        LoginMsg loginMsg = LoginMsg.fromJson(jsonMsg);
        print("json转实体类：" + loginMsg.toString());

        ///更新UI
//            Navigator.pushReplacement(context, MaterialPageRoute(
//                builder: (context) => BottomNavigationWidget(),
//                settings: RouteSettings(
//                arguments:jsonMsg,
//               ),
//            ));
        setState(() {
          need_login = false;
          ///隐藏键盘
          FocusScope.of(context).requestFocus(FocusNode());
        });
//        getUserCourseList(loginMsg);
      });
    }, (error) {
      setState(() {});
      print("登录异常：" + error.toString());
    });
  }

  ///获取用户课程信息
  void getUserCourseList(LoginMsg loginMsg) {
    ///显示指定Map的限定类型
    Map<String, String> parms = {
      "student_id": loginMsg.data.studentId.toString()
    };
    Map<String, String> headers = {
      "token": loginMsg.data.loginToken.toString()
    };
    DioManger.getInstance().get(APIConfig.GET_COURSE_LIST, parms, headers,
        (data) {
      print("获取课程列表成功：" + data.toString());

      /// 登录成功发送全局事件
      bus.emit('login', loginMsg);
    }, (error) {
      print("获取课程列表失败：" + error.toString());
    });
  }

  ///微信登录
  void loginWX() {
    print("微信登录");
    fluwx
        .sendAuth(scope: "snsapi_userinfo", state: "wechat_sdk_demo_test")
        .then((data) {
      setState(() {
        print("拉取微信用户信息：" + data.toString());
      });
    }).catchError((e) {
      print('weChatLogin  e  $e');
    });
  }
}
