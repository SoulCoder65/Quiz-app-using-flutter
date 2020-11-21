import 'package:flutter/material.dart';
import 'quizpage.dart';
Widget CardPrototype(context,String quiz_name,String quiz_description,String img,String json_data)
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: MediaQuery.of(context).size.width*0.8,
        margin: const EdgeInsets.only(left: 40,top: 20),
        child: Card(
          child: InkWell(
            splashColor: Colors.black54,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GetData(json_data:json_data),));
              },
            child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                    colors: [Colors.brown,Colors.brown],

                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                   ListTile(
                    title: Text(
                      quiz_name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,

                      ),

                    ),
                    subtitle: Text("10 Questions",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent
                    ),),

                  ),
                  Center(child: Container(
                    padding: const EdgeInsets.only(top: 20),

                      child: Image.asset(img,height: 160,)) ,),
                 SizedBox(height: 5,),
                  Container(
                    child: Text(quiz_description,maxLines: 5,style:
                    TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                    ),
                    ),
                    margin: const EdgeInsets.only(left: 10,right: 10),
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ),

        ),
      ),
    ],
  );
}
