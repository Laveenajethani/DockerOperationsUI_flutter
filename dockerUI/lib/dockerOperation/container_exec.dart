import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';

class DCexec extends StatefulWidget {
  @override
  _DCexecState createState() => _DCexecState();
}

class _DCexecState extends State<DCexec> {
  var value;
  var output;
  var containername;
  var command;
  var msgTextContoller1 = TextEditingController();
  var msgTextContoller2 = TextEditingController();
  
  web(containername, imagename) async {
    var url =
        "http://192.168.43.97/cgi-bin/DCexec.py?x=${containername}&c=${command}";
    var responce = await http.get(url);
    setState(() {
      output = responce.body;
    });
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
                      margin: EdgeInsets.only(right: 30.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Docker Container Exec",
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
                    command = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter Command",
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
                  child: Text("Run Command", style: TextStyle(fontSize: 20.0)),
                  onPressed: () {
                    web(containername, command);
                    msgTextContoller1.clear();
                    msgTextContoller2.clear();
                  },
                ),
              ),
              SizedBox(height: 20,),
              Text(output ?? "Output is coming",style: TextStyle(color: Colors.white),),
            ],
          ),
        ));
  }
}
