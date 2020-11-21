import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Card.dart';
class QuizSelect extends StatefulWidget {
  @override
  _QuizSelectState createState() => _QuizSelectState();
}

class _QuizSelectState extends State<QuizSelect> {

//TITLE OF QUIZ CARDS
  var titleName=[
    "Python Quiz",
    "JavaScript Quiz",
    "Java Quiz",
    "C Quiz",
    "C++ Quiz"
  ];
// DESCRIPTION OF QUIZ CARDS
  var description=[
    "Python is a high-level, interpreted, interactive and object-oriented scripting language. Python is designed to be highly readable.",
    "JavaScript is a scripting language used to create and control dynamic website content, i.e. anything that moves, refreshes, or otherwise changes on your screen without requiring you to manually reload a web page.",
   "Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.",
    "C is a powerful general-purpose programming language. It can be used to develop software like operating systems, databases, compilers, and so on. "

  ];
  //IMAGES OF QUIZ CARDS
  var images=[
    "images/pythonlogo.png",
    "images/javascriptlogo.png",
    "images/javalogo.png",
    "images/clogo.png"
  ];

  //JSON FILES OF QUIZ CARDS
  var json_files=[
    "assets/python.json",
    "assets/javascript.json",

  ];
//Cards Data End

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.fill
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Select Quiz",style: GoogleFonts.getFont('Roboto Condensed',
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              )
            )),
            leading: Icon(Icons.games,color: Colors.black,),
            backgroundColor: Colors.yellow,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  //Python
                  CardPrototype(context,titleName[0],description[0],
                  images[0],json_files[0]),
                  //Javascript
                  CardPrototype(context,titleName[1],description[1],
                      images[1],json_files[1]),
                  //Java
                  CardPrototype(context,titleName[2],description[2],
                      images[2],json_files[1]),
                //  C
                  CardPrototype(context,titleName[3],description[3],
                      images[3],json_files[1]),
                ],
              ),
            ),
          ),
        ),
      );

  }
}
