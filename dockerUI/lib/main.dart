import 'package:flutter/material.dart';
import 'UI/docker_list.dart';
import 'UI/login.dart';
import 'UI/register.dart';
import 'UI/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dockerOperation/Running_Container.dart';
import 'dockerOperation/Start_Container.dart';
import 'dockerOperation/Stopped_container_see.dart';
import 'dockerOperation/container_exec.dart';
import 'dockerOperation/docker_image.dart';
import 'dockerOperation/launch_container.dart';
import 'dockerOperation/pull_image.dart';
import 'dockerOperation/remove_container.dart';
import 'dockerOperation/remove_image.dart';
import 'dockerOperation/stop_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => MySplash(),
      "login": (context) => MyLog(),
      "register": (context) => MyReg(),
      "dockerlist": (context) => MyDocker(),
      "DIlist": (context) => DIlist(),
      "DClaunch": (context) => DClaunch(),
      "DIpull": (context) => DIpull(),
      "DCremove": (context) => DCremove(),
      "DIremove": (context) => DIremove(),
      "DCrunning": (context) => DCrunning(),
      "DCstart": (context) => DCstart(),
      "DCstop": (context) => DCstop(),
      "DCstopped": (context) => DCstopped(),
      "DCexec": (context) =>  DCexec(),
    },
  ));
}
