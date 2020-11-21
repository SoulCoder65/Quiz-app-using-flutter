import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ScorePage.dart';
class GetData extends StatelessWidget {
  final String json_data; //getting json data

  GetData({Key key,@required this.json_data}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(json_data),
        builder: (context, snapshot) {
          List data=json.decode(snapshot.data.toString());
          if(data==null)
          {
              return Center(
              child: Text("Loading....."),
              );
          }
          else{
                return StartGame(data:data);
              }
        },
      ),
    );
  }
}
class StartGame extends StatefulWidget {
   final data;

  StartGame( {Key key,@required this.data}):super(key:key);
  @override
  _StartGameState createState() => _StartGameState(data:data);
}


class _StartGameState extends State<StartGame> {
  List data;
  //BTNS COLORS
  Map<String,Color> optionColor={
    "a":Colors.blueGrey,
    "b":Colors.blueGrey,
    "c":Colors.blueGrey,
    "d":Colors.blueGrey,
  };

  //TIMER FOR QUESTION
  var stopwatch=Stopwatch();
  final duration=const Duration(seconds: 1);
  bool started=true;
  bool stopped=true;
  bool reset=false;
  bool questionCompleted=false;
  int TimeDisplay=0;
  int revereseTime=30;
  double timervalue=0;
  int score=0;
  _StartGameState({this.data});
  //Options Custom Widgets
  Widget OptionButton(String op)
  {
    return ButtonTheme(
      minWidth: 250,
      child: RaisedButton(
        child: Text(data[1][count.toString()][op],style:  GoogleFonts.getFont('Roboto',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
        )),
        color: optionColor[op] ,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white70),
        ),
        onPressed: () {
          checkAns(op);
        },
      ),
    );
  }
  //Options Custom Widgets End

 //START TIMER AS PAGE RENDERED
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startStopWatch();
  }
  @override
  void setState(fn)
  {
    if(mounted)
      {
        super.setState(fn);
      }
  }

  //Counter to Change Question
  int count=1;
  void changeQuestion()
  {

    setState(() {
      questionCompleted=false;
      stopwatch.reset();
      TimeDisplay=0;
      revereseTime=30;
      timervalue=0;

    });
    if(count<10)
    {
      count++;
      startStopWatch();
      // Reset colors
      optionColor={
        "a":Colors.blueGrey,
        "b":Colors.blueGrey,
        "c":Colors.blueGrey,
        "d":Colors.blueGrey,
      };

    }
    else{
      //  Test Over REDIRECT TO RESULT PAGE
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => ScorePage(score:score),));
    }
  }
  //Counter to Change Question End

  //------------------------//
  //Check Answer Function
  void checkAns(String op)
  {
    if(data[1][count.toString()][op]==data[2][count.toString()])
    {
      setState(() {
        optionColor[op]=Colors.green;
        questionCompleted=true;
      });
      score=score+5;

    }
    else{
      setState(() {
        optionColor[op]=Colors.red;
        questionCompleted=true;
      });
    }

  }

  //Check Answer Function End

//--------------------------//
  //Timer fun run after each sec
  void timerFun()
  {
    Timer(duration,keepRunning);
  }
  //TO update time
  void keepRunning()
  {
    //if stop is false then continue......
    if(TimeDisplay==29 || questionCompleted)
      {
        TimeDisplay=0;
        stopwatch.reset();
        changeQuestion();

      }
    else if(stopwatch.isRunning)
    {
      setState(() {
        revereseTime=revereseTime-1;
      });
      timerFun();
    }
    //Updating time
    setState(() {
      TimeDisplay=stopwatch.elapsed.inSeconds;
      timervalue=(((TimeDisplay)/29));
    });
  }
  //fun call when start press
  void startStopWatch()
  {
    setState(() {
      stopped=false;
      started=false;
    });
    stopwatch.start();
    timerFun();
  }
  //fun call when stop press
  void stopStopWatch()
  {
    setState(() {
      stopped=true;
      reset=true;
    });
    stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        
          onWillPop: (){
            return showDialog(context: context,
              builder: (context) => AlertDialog(
                title: Text("Exit Quiz"),
                content: Text("Are you sure you want to quit this Quiz??"),
                actions: [
                  FlatButton(onPressed: () {
                    Navigator.of(context).pop(true);
                  }, child: Text("Yes")),
                  FlatButton(onPressed: () {
                    Navigator.of(context).pop(false);
                  }, child: Text("No"))
                ],
              ),);
          },

      //End

      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./images/bg.jpg"),
            fit: BoxFit.fill,
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.yellow,
            title: Text("All The Best",
          style: GoogleFonts.getFont('Roboto Condensed',
          textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.lime,
                offset: Offset(3,3),
                blurRadius: 30
              )
            ]
      ),
            ),
            )  ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 28,top: 20),
                child: Column(
                  children: [
                    new LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width*0.9,
                      lineHeight: 26,
                      percent: timervalue,
                      backgroundColor: Colors.black,
                      linearGradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent,Colors.purple

                        ]
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("${revereseTime-1}",style:
                      TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),),
                  //Questions  Section
                    Container(
                      alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 35),
                        child: Text("Question ${count}/10",style:
                          TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),),),
                    new Container(height: 1, width: MediaQuery.of(context).size.width*1, color: Colors.grey,
                      margin: const EdgeInsets.only( right: 10.0,top: 15),),

                    //  QUESTION TEXT
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Text('${data[0][count.toString()]}',maxLines: 5,
                          style:GoogleFonts.getFont("Lato",
                            fontSize: 22,
                              color: Colors.white,
                          )
                      ),
                    ),
                  //  OPTIONS FOR QUESTION
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          //Btn 1
                          OptionButton("a"),
                          SizedBox(height: 10,),
                          //Btn 2
                          OptionButton("b"),
                          SizedBox(height: 10,),
                          //Btn 3
                          OptionButton("c"),
                          SizedBox(height: 10,),
                          //Btn 4
                          OptionButton("d"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [

                            Icon(Icons.copyright),
                            Text(data[3]["credit"],style: TextStyle(
                              color: Colors.white10
                            ),)
                        ],
                      )

                    )


                  ],
                ),
              ),

            ),
          )
        )
      ),
    );
  }
}
