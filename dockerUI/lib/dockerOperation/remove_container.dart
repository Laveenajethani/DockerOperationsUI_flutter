import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DCremove extends StatefulWidget {
  @override
  _DCremoveState createState() => _DCremoveState();
}

class _DCremoveState extends State<DCremove> {
  var url;
  var output;
  var outputall;
  var containername;
  var msgTextContoller = TextEditingController();
  dockerweb(containername) async {
    var url = "http://192.168.43.97/cgi-bin/DCremove.py?x=${containername}";
    var response = await http.get(url);
    setState(() {
      output = response.body;
    });
  }

  dockerweball() async {
    var url = "http://192.168.43.97/cgi-bin/DCremoveALL.py";
    var response = await http.get(url);
    setState(() {
      outputall = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade600,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(110.0)),
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
                      margin: EdgeInsets.only(right: 25.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Remove Docker Container",
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
                    onChanged: (value) {
                      containername = value;
                    },
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.tablet_android, color: Colors.white),
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
                    cursorColor: Colors.blue,
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
                        "Remove Container",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        dockerweb(containername);
                        print("pressed");
                      }),
                ),
                Text(output ?? "output is coming....",
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.lightBlue.shade600,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: MaterialButton(
                      minWidth: 200,
                      child: Text(
                        "Remove All Container",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        dockerweball();
                        print("pressed");
                      }),
                ),
                Text(outputall ?? "output is coming.....",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ));
  }
}
