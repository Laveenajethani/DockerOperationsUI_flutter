import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dockerUI/UI/login_sign.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: AfterSplash(),
      title: Text(
        "Welcome To Docker App",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 30.0,
          color: Colors.blue.shade500,
        ),
      ),
      image: Image.asset("assets/docker_home.png"),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Welcome to Docker"),
      loaderColor: Colors.blue.shade100,
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LogSign();
  }
}
