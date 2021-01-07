import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';

class DClaunch extends StatefulWidget {
  @override
  _DClaunchState createState() => _DClaunchState();
}

class _DClaunchState extends State<DClaunch> {
  var value;
  var output;
  var webdata;
  var containername;
  var imagename;
  var msgTextContoller1 = TextEditingController();
  var msgTextContoller2 = TextEditingController();
  web(containername, imagename) async {
    var url =
        "http://192.168.43.97/cgi-bin/Drun.py?x=${containername}&y=${imagename}";
    var responce = await http.get(url);
    setState(() {
      output = responce.body;
    });
    Fluttertoast.showToast(
        msg: output,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(110.0)),
                    color: Colors.lightBlue.shade600),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset("assets/docker_container.jpg"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 25.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Launch Docker Container",
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: msgTextContoller1,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    containername = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter Container Name",
                    prefixIcon: Icon(Icons.tablet_android, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: msgTextContoller2,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    imagename = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter a Image Name",
                    prefixIcon: Icon(Icons.tablet_android, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.lightBlue.shade600,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  textColor: Colors.white,
                  minWidth: 200,
                  height: 40,
                  child: Text("Launch container",
                      style: TextStyle(fontSize: 20.0)),
                  onPressed: () {
                    web(containername, imagename);
                    msgTextContoller1.clear();
                    msgTextContoller2.clear();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
