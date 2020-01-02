import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginState();
  }
}

class _LoginState extends State<CourseScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('选课'),
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0,32.0,30.0,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("images/course_logo.png"),
                width: 139,
                height: 38,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  height: 50,
                  width: 307,
                  padding: EdgeInsets.only(left: 10.0),
                  alignment:AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
//                      labelText: "手机号",
                      hintText: "请输入手机号",
                      border: InputBorder.none,
//                    helperText: "请输入11位手机号",
//                    helperStyle: TextStyle(
//                      color: Colors.red,
//                      fontSize: 12,
//                    ),
                    contentPadding: EdgeInsets.zero,
                    ),
                    maxLength: 11,
                    onChanged: (v){
//                      print("手机号:$v");
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: 307,
                  padding: EdgeInsets.only(left: 10.0),
                  alignment:AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "请输密码",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: (v){
//                      print("密码:$v");
                    },
                  ),
                ),
              ),


            ],
          ),
        ));
  }


}
