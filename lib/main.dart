import 'package:flutter/material.dart';
import 'package:test1/src/resources/auth/introduce_home.dart';
import "package:splashscreen/splashscreen.dart";
import 'package:test1/src/resources/auth/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: _SplashScreen(),
    );
  }
}

Widget _SplashScreen() {
  return  new SplashScreen(
        title: new Text(
          'Welcome In Nexflix',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        seconds: 3,
        navigateAfterSeconds: IntroduceHomePage(),
        //navigateAfterSeconds: LoginPage(),
        image: new Image.asset('assets/graphics/fplash_screen.gif'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: null,
        
      );
}

