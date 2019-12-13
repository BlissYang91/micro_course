import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget{
  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child:Image.asset('images/lauch.jpg') ,
          )
        ],
      ),
    );
  }


}