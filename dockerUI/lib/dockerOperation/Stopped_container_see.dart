import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DCstopped extends StatefulWidget {
  @override
  _DCstoppedState createState() => _DCstoppedState();
}

class _DCstoppedState extends State<DCstopped> {
  var url;
  var output;
  dockerweb() async {
    var url = "http://192.168.43.97/cgi-bin/DCstopped.py";
    var response = await http.get(url);
    setState(() {
      output = response.body;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dockerweb();
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
                height: 200,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(110.0)),
                    color: Colors.lightBlue.shade600),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.asset("assets/docker_container.jpg"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Stopped Docker Container",
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
                Center(
          child: Container(
                color: Colors.transparent,
                child: Text(output ?? "output is coming....",style: TextStyle(color: Colors.white),),
          ),
        ),
              ],
            )));
  }
}
