import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';

class DIpull extends StatefulWidget {
  @override
  _DIpullState createState() => _DIpullState();
}

class _DIpullState extends State<DIpull> {
  var imagename;
  var url;
  var output;
  var msgTextContoller = TextEditingController();
  dockerweb(imagename) async {
    var url = "http://192.168.43.97/cgi-bin/DIpull.py?i=${imagename}";
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
        child: Column(
          children: [
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
                      child: Image.asset("assets/docker_image.jpg"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 60.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Pull Docker Image",
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
                  hintText: 'Enter Image Name',
                ),
                cursorColor: Colors.blue,
                onChanged: (val) {
                  print(val);
                  imagename = val;
                },
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
                    "Pull Image",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    dockerweb(imagename);
                    print("pressed");
                    msgTextContoller.clear();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
