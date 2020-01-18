import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_course/widgets/login.dart';

class CourseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<CourseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            '选课',
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
          shrinkWrap: true,///根据子组件的总长度来设置 ListView 的长度
          children: <Widget>[
            Container(
                alignment: AlignmentDirectional.center,
                child: LoginWidget(),///引入公共登录组件
            ),
          ],
        ));
  }
}
