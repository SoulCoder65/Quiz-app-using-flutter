import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_select.dart';
class ScorePage extends StatefulWidget {
  int score;
  ScorePage({Key key,@required this.score}):super(key: key);
  @override
  _ScorePageState createState() => _ScorePageState(score);
}

class _ScorePageState extends State<ScorePage> {
  int score;
  _ScorePageState(this.score);
  String imgnum="1";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(score<=12)
      {
        setState(() {
          imgnum="3";
        });
      }
    else if(score<=30){
      setState(() {
        imgnum="2";
      });

    }
    else{
      setState(() {
        imgnum="1";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.jpg")
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(

          child: Column(

            children: [
              Expanded(child: Container(
            margin: const EdgeInsets.only(top: 150),
                decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/bestscore${imgnum}.png",),

        )
      ),

    ),),
              Expanded(flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 100),

                  child: RichText(
                    text: TextSpan(
                      text: "You Score: ",
                      style: GoogleFonts.getFont('Lato',
                      fontSize: 30,
                      color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: "$score",
                          style: GoogleFonts.getFont('Lato',
                            fontSize: 37,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold
                          ),)
                      ]
                    ),
                  ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 120),
                child: RaisedButton(
                color: Colors.yellowAccent,
                  textColor: Colors.black,
                  elevation: 120,
                  

                  child: Text(
                    "Take Another Quiz"
                  ),
                  onPressed: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizSelect(),));
                  },

                ),
              )
            ],

          )
        ),
      ),
    );
  }
}
