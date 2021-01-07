import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
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
                  "Register To Docker App",
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
                            borderRadius: BorderRadius.circular(50)),
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
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(50)),
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
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      try {
                        var user = await authc.createUserWithEmailAndPassword(
                            email: email, password: password);
                        print(user);
                        if (user.additionalUserInfo.isNewUser == true) {
                          Fluttertoast.showToast(
                         msg: "Register Successfull",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 10,
                         backgroundColor: Colors.blue,
                        textColor: Colors.white,
                         fontSize: 16.0);
                          Navigator.pushNamed(context, "login");
                        }
                      } catch (e) {
                        print(e);

                        Fluttertoast.showToast(
                         msg: "Register Unsuccessfully",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 10,
                         backgroundColor: Colors.blue,
                        textColor: Colors.white,
                         fontSize: 16.0);
                          Navigator.pushNamed(context, "login");
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
