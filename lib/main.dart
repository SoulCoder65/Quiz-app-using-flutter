import 'package:flutter/material.dart';
import 'welcome.dart';
//MAIN APP
void main()=>runApp(new MaterialApp(
  title: "Quiz App",
  theme: ThemeData(
    backgroundColor: Colors.black,
    primarySwatch: Colors.deepPurple
  ),
  home: WelcomeScreen(),
));
