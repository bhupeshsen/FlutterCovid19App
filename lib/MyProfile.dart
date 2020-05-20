
import 'package:coronapp/Animation/FadeAnimation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coronapp/constant.dart';
import 'package:coronapp/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyProfilePage> {

  Future _launchURL() async {
    const url = 'http://www.majorminorproject.com/blog.php';

    await launch(url);

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),

          backgroundColor: primaryColor,
        ),
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(


                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFE8505B),
                          Color(0xFFCB4650),
                        ],
                      ))

              ),
              clipper: getClipper(),
            ),
            Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: <Widget>[
                    FadeAnimation(1, Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color:  Color(0xFFE8505B),

                            image: DecorationImage(
                                image: new NetworkImage("https://tgrsoftware.com/extra/image/team/Bhupesh%20Sen.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0,

                                color: Color(0xFFCB4650),
                              )
                            ]))),
                    SizedBox(height: 30.0),
                    Text(
                      'Bhupesh Sen',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Bhupeshsen11@gmail.com',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 25.0),
                    Container(
                        height: 40.0,
                        width: 140.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),

                           color: Color(0xFFCB4650),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              launch("tel://7974430255");
                            },
                            child: Center(
                              child: Text(
                                'Call : 7974430255',
                                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 25.0),
                    Container(
                        height: 40.0,
                        width: 140.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Color(0xFFCB4650),
                          color: Color(0xFFCB4650),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL();

                            },
                            child: Center(
                              child: Text(
                                'My Blog Website',
                                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ))
                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}