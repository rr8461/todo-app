import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/screens/home.dart';
//import 'dart:html';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 254, 18, 18)),);
    //status bar settings
    return MaterialApp(
      title: 'TODO',
      debugShowCheckedModeBanner: false,//remove corner debug
      // theme: ThemeData(
      //   //colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 228, 9, 9)),
      //   useMaterial3: true,
      //),
      home: Home(),//first screen
    );
  }
}

