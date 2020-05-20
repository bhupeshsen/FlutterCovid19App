

import 'package:coronapp/constant.dart';
import 'package:coronapp/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoronaInfo extends StatefulWidget{

   _CoronaInfo createState() => new _CoronaInfo();
}


class _CoronaInfo extends State<CoronaInfo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptoms & Prevention"),

        backgroundColor: primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            gradient: LinearGradient(
              colors: [
                Color(0xFFE8505B),
                Color(0xFFCB4650),
              ],
            )),
        child:   ListView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child:   Stack(
                children: <Widget>[
                  Container(

                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFE8505B),
                            Color(0xFFCB4650),
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 0.0),
                        Padding(
                            padding:
                            EdgeInsets.all(10),
                            child:  Column(
                              children: <Widget>[
                                SizedBox(height: 5),
//                             Align(
//                               alignment: Alignment
//                                   .centerLeft,
//                               child: Column(
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(20.0),
//                                     child:  Text(
//                                       widget.StateName,
//
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 30),
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),

                                SizedBox(height: 0),



                              ],
                            )
                        ),


                        SizedBox(
                          width: double.infinity,

                          child: Column(
                            
                            
                            
children: <Widget>[
  
  Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            color: kShadowColor,
          ),

        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment
                  .centerRight,
              child: Column(
                children: <Widget>[
//                  Text(
//                    "Symptons",
//                    textAlign: TextAlign.left,
//                    style: TextStyle(
//                        color: Colors.black,
//                        fontFamily:
//                        'Quicksand',
//                        fontSize:
//                        16,
//                        fontWeight:
//                        FontWeight.bold),
//                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Image.asset("assets/images/symptoms.png",height: 300),
          ],
        ),
      ) ,
    ),
  ),
  Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[


        PreventCard(
          text:
          "Cover your mouth/nose with a tissue or sleeve when coughing or sneezing",
          image: "assets/images/service1.png",
          title: "Cover Face When Coughing",
        ),
        PreventCard(
          text:
          "Wash hands often with soap and water. If not available, use hand sanitizer.",
          image: "assets/images/service3.png",
          title: "Wash Your Hand Frequently",
        ),



      ],
    ),
  )
  
],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}