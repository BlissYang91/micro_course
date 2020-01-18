import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_course/bean/LoginMsg.dart';
import 'package:micro_course/utils/HexColor.dart';
import 'package:micro_course/http/DioManger.dart';
import 'package:micro_course/http/APIConfig.dart';
import 'package:micro_course/common/eventbus.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginWidget> {
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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

//        Scaffold.of(context).showSnackBar(SnackBar(
//          content: Text('点击登录'+phoneController.text),
//        ));
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
        getUserCourseList(loginMsg);
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
