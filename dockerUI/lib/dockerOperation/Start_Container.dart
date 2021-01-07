import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';

class DCstart extends StatefulWidget {
  @override
  _DCstartState createState() => _DCstartState();
}

class _DCstartState extends State<DCstart> {
  var url;
  var output;
  var containername;
  var msgTextContoller = TextEditingController();
  dockerweb(value) async {
    var url = "http://192.168.43.97/cgi-bin/DCstart.py?x=${containername}";
    var response = await http.get(url);
    setState(() {
      output = response.body;
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
        child: Container(
          child: Column(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade600,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(130.0)),
                ),
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
                      margin: EdgeInsets.only(right: 50.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Start Docker Container",
                        textAlign: TextAlign.right,
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
                  controller: msgTextContoller,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  autocorrect: false,
                  cursorColor: Colors.white,
                  onChanged: (val) {
                    print(val);
                    containername = val;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2, color: Colors.lightBlue)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Container Name',
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
                    minWidth: 200,
                    child: Text(
                      "Start Container",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      dockerweb(containername);
                      print("pressed");
                      msgTextContoller.clear();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
