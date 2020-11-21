import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'quiz_select.dart';

//WELCOME SCREEN WIDGET
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  //AFTER 4 SEC REDIRECT TO SELECT QUIZ PAGE
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer timer=new Timer(Duration(seconds: 4),()=>{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizSelect(),))
   });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.jpg"),
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

               Text("Welcome To Soul Quiz",style:GoogleFonts.getFont('Oswald',
                  textStyle: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                 shadows: [
                   Shadow(
                     color: Colors.deepPurple,
                     blurRadius: 10.0,
                     offset: Offset(5.0,5.0)
                   )
                 ]
               ),
               ),
                SizedBox(height: 40,),
                Container(
                  child: SpinKitCircle(color: Colors.white,size: 70,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
