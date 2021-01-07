import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DCrunning extends StatefulWidget {
  @override
  _DCrunningState createState() => _DCrunningState();
}

class _DCrunningState extends State<DCrunning> {
  var url;
  var output;
  dockerweb() async {
    var url = "http://192.168.43.97/cgi-bin/DCrunning.py";
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
            child: Center(
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
                        "Running Docker Container",
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
                color: Colors.transparent,
                child: Text(
                  output ?? "output is coming....",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )));
  }
}
