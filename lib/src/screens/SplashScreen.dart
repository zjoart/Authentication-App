

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState(){
    super.initState();
   
    }

 

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
    return Container(
    width: width,
    height: height,
      child: Image.asset(
                    'images/launch.jpg',
                   fit: BoxFit.fitWidth,
                    width: width,
                    height: height,
                  ),
    );
  }
}