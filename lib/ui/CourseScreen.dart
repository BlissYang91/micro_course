import 'package:flutter/material.dart';
import 'package:micro_course/utils/HexColor.dart';
import 'package:micro_course/http/DioManger.dart';
import 'package:micro_course/http/APIConfig.dart';
class CourseScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<CourseScreen>{
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0,32.0,30.0,0),
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
              ],
            ),
          )),
        );

  }
  ///手机号模块
  Widget inputPhone(BuildContext context){
    return Padding(
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
        child: TextField(
          autofocus: true,
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "请输入手机号",
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (v){
//                      print("手机号:$v");
          },
        ),
      ),
    );
  }
  /// 密码模块
  Widget inputPassword(BuildContext context){
    return  Padding(
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
          controller: pwdController,
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
    );
  }
  /// 登录模块
  Widget loginWidget(BuildContext context){
    return GestureDetector(
      onTap: (){
          var params = {
            "phone":phoneController.text,
            "password":pwdController.text,
          };
          login(params);

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
                  borderRadius:
                  BorderRadius.all(Radius.circular(45)),
                ),
              ),
              Text(
                '登录',
                style: TextStyle(
                    fontSize: 18, color: HexColor('#824E00')),
              ),
            ],

          ),
        ),
      ),
    );
  }

  void login(Map<String, String> params) {
    DioManger.getInstance().post(
        APIConfig.LOGIN,
        params, (data){
          setState(() {
            ///更新UI
          });
          print("登录成功："+data.toString());
        }, (error){
          setState(() {

          });
          print("登录异常："+error.toString());
        }
    );
  }
}
