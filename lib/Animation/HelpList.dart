import 'package:flutter/material.dart';


class HelpList extends StatefulWidget{
  _HelpList createState () => new _HelpList();
}


class _HelpList extends State<HelpList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Help List"),
        flexibleSpace: Container(
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(0),
                gradient: LinearGradient(
                  colors: [Color(0xff2338ef),Color(0xff182bdb),Color(0xff2b39b5)],
                )
            )
        ),
      ),
    );
  }
  
}