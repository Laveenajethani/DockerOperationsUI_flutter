import 'package:dockerUI/UI/login.dart';
import 'package:flutter/material.dart';

class LogSign extends StatefulWidget {
  @override
  _LogSignState createState() => _LogSignState();
}

class _LogSignState extends State<LogSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 300,
                child: Image.asset("assets/login&sign_docker.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.lightBlue.shade600,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 250,
                  height: 60,
                  textColor: Colors.white,
                  child: Text("Registration", style: TextStyle(fontSize: 20.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, "register");
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 250,
                  height: 60,
                  textColor: Colors.white,
                  child: Text("Login",
                      style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                  onPressed: () {
                    Navigator.pushNamed(context, "login");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
