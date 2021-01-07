import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyLog extends StatefulWidget {
  @override
  _MyLogState createState() => _MyLogState();
}

class _MyLogState extends State<MyLog> {
  var authc = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Login To Docker App",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset("assets/LR_logo.png"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Theme(
                    data: new ThemeData(hintColor: Colors.white),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        email = val;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(40)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Theme(
                    data: new ThemeData(hintColor: Colors.white),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      onChanged: (val) {
                        password = val;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        prefixIcon: Icon(
                          Icons.lock_sharp,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(40)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    minWidth: 200,
                    height: 50,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      try {
                        var userSignIn = await authc.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(userSignIn);
                        if (userSignIn != null) {
                          Navigator.pushNamed(context, "dockerlist");
                          Fluttertoast.showToast(
                         msg: "Login Successfull",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 10,
                         backgroundColor: Colors.blue,
                        textColor: Colors.white,
                         fontSize: 16.0);
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                         msg: "Login Unsuccessfull",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 10,
                         backgroundColor: Colors.blue,
                        textColor: Colors.white,
                         fontSize: 16.0);
                        print(e);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
