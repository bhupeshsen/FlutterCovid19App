
import 'package:coronapp/MyProfile.dart';
import 'package:coronapp/Review.dart';
import 'package:coronapp/StateWiseData.dart';
import 'package:coronapp/constant.dart';
import 'package:coronapp/helper/function.dart';
import 'package:coronapp/prevensytrom.dart';
import 'package:coronapp/whowebview.dart';
import 'package:coronapp/widgets/counter.dart';
import 'package:device_id/device_id.dart';
import 'package:coronapp/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'All_Widget/widgetclass.dart';
import 'CountryData.dart';
import 'modelclass/CountryView.dart';
import 'dart:async';
import 'package:package_info/package_info.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'modelclass/IndiaView.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => new _HomePage();
}
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
  static String versionName="";

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
class _HomePage extends State<HomePage> {
  List<IndiaModel> countryList;
  List<IndiaModel> filterData;
  String StateName;

  TextEditingController editingController = TextEditingController();

  final _debouncer = Debouncer(milliseconds: 500);
  Future<List> getData() async {
    final response =
        await http.post("http://bhssolution.com//coviddb/apifolder/getTodayInfo.php");
    print("responsedata" + response.body.toString());
    return json.decode(response.body);
  }



  getDeviceId() async {
    String device_id = await DeviceId.getID;
    print("device_id"+device_id.toString());
    Map<String, String> body = {"deviceId":device_id};
    var jsondata=   await http.post("http://bhssolution.com//coviddb/apifolder/getTodayInfo.php",headers: {"Accept": "application/json"},body: body);


    var decodeRes =jsonDecode(jsondata.body);

    String versionnew=decodeRes['current'];

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    print("versionpackageinfo"+packageInfo.version);

    if(versionnew==packageInfo.version){

    }else{
      _showVersionDialog(context);
    }

    print("response data"+decodeRes.toString());


  }

  postData() async {






  }
getVersion() async {

  //Map<String, String> body = {"email":"rudraumnetwork111@gmail.com","firstname":"rudraum","lastname":"network"};
    var jsondata=   await http.post("http://bhssolution.com/data/api/mystore/login.php",headers: {"Accept": "application/json"},body: {"username":"bhs","password":"102030"});
   // var jsondata=   await http.post("http://www.cinemarathi.in/en/dev/talent_provider_wb/signup_facebook_google",headers: {"Accept": "application/json"},body: body);


    var decodeRes =jsonDecode(jsondata.body);
  // String version =decodeRes['status'];

//print("versioname"+version.toString());


  }

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  void initState() {
    super.initState();
    //getData();
    getDeviceId();
    //getVersion();

    fetchIndidata("data.json").then((value) {
      setState(() {
        countryList = value;
        filterData = value;
      });
    });
  }
  Future shareNotice() async {
    await Share.share("For tracking Covid-19 Cases all over the world and also track Indian cases according to the state click on the link for downloading the app and please share alsoand please share also http://bhssolution.com/covid/covid19.apk");
  }

  Future _launchURL() async {
    const url = "http://bhssolution.com";
      await launch(url);

  }
  Widget _StateDataCard(String name, String status, int cardIndex, Colorsget) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(height: 10.0),
        Stack(children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      color: Colorsget,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.0),
                Text(
                  status,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]),
      ],
    );
  }


  _showVersionDialog(context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update Available";
        String message =
            "There is a newer version of app available please update it now.";
        String btnLabel = "Update Now";
        String btnLabelCancel = "Later";
        return new AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(btnLabel),
              onPressed: () =>launch("http://bhssolution.com/covid/covid19.apk")
            ),
            FlatButton(
              child: Text(btnLabelCancel),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
//  _launchURL(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
  Widget _buildCard(String name, String status, int cardIndex, Colorsget) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 30,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 15.0),
          Stack(children: <Widget>[
            Container(

              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[


                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 11,
                        color: Colorsget,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    status,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      // margin: cardIndex.isEven? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0):EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE8505B),
                    Color(0xFFCB4650),
                  ],
                )),
          ),
          elevation: 0.0,
          title: new Text("INDIA-COVID-19-CASES"),
        ),
        drawer: new Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new Container(
                // padding: EdgeInsets.all(5),

                child:  MyHeader(
                  image: "assets/icons/Drcorona.svg",
                  textTop: "Please",
                  textBottom: "stay at home.",
                ),
              ),
      new Container(
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: new LinearGradientMask(
                child: Icon(

                    Icons.arrow_forward_ios,
                    color: Color(0xFFCB4650),
                    size: 16.0
                ),
              ),

              title: new Text("World Cases",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new CountryData())
                );



              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,

            ),
            new ListTile(
              leading: new LinearGradientMask(
                child: Icon(

                    Icons.arrow_forward_ios,
                    color: Color(0xFFCB4650),
                    size: 16.0
                ),
              ),

              title: new Text("India Cases",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage())
                );



              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,

            ),
            new ListTile(

              leading: new LinearGradientMask(
                child: Icon(

                    Icons.arrow_forward_ios,
                    color: Color(0xFFE8505B),

                    size: 16.0
                ),
              ),
              title: new Text("Who",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new WebViewTest())
                );


              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,
            ),
            new ListTile(

              leading: new LinearGradientMask(
                child: Icon(

                    Icons.arrow_forward_ios,
                    color: Color(0xFFE8505B),

                    size: 16.0
                ),
              ),
              title: new Text("News",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new NewsPage())
                );


              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,
            ),
            new ListTile(
              leading: new LinearGradientMask(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Color(0xFFE8505B),
                  )
              ),
              title: new Text("Prevention",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new CoronaInfo())
                );


              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,

            ),
            new ListTile(
              leading: new LinearGradientMask(
                child: Icon(

                    Icons.arrow_forward_ios,
                    color: Color(0xFFCB4650),
                    size: 16.0
                ),
              ),

              title: new Text("My Profile",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new MyProfilePage())
                );



              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,

            ),
            new ListTile(
              leading: new LinearGradientMask(
                child: Icon(

                    Icons.arrow_forward_ios,
                    color: Color(0xFFCB4650),
                    size: 16.0
                ),
              ),

              title: new Text("Review Us",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new MyHomePage())
                );



              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,

            ),
            new ListTile(
              leading: new LinearGradientMask(
                child: Icon(

                    Icons.share,
                    color: Color(0xFFCB4650),
                    size: 16.0
                ),
              ),

              title: new Text("Share",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
              onTap: (){
                // _showVersionDialog(context);
                shareNotice();
                // _launchURL();


              },

            ),
            new Divider(
              color: Colors.black,
              height: 0.5,

            ),

          ],
        ),
      ),


            ],
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: filterData == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        children: <Widget>[
                          Container(
                            height: 280.0,
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
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10.0),

                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child:  CasesCardTopList(
                                    state : 'Total Cases',
                                    active :'${countryList[0].active}',
                                    confirmed:'${countryList[0].confirmed}',
                                    recovered:'${countryList[0].recovered}',
                                    death:'${countryList[0].deaths}',
                                  ),
                                ),

                                SizedBox(height: 10.0),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Material(
                                    elevation: 5.0,
                                    shadowColor: kActiveShadowColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {


      filterData = countryList
          .where((u) => (u.state
          .toLowerCase()
          .contains(value
          .toLowerCase()) ||
          u.active
              .toLowerCase()
              .contains(value
              .toLowerCase())))
          .toList();






                                          });
                                        },

                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.search,
                                                color: Color(getColorHexFromStr(
                                                    '#000000')),
                                                size: 30.0),
                                            contentPadding: EdgeInsets.only(
                                                left: 15.0, top: 15.0),
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'Quicksand'))),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  height: 600,
                                  child: filterData == null
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: filterData.length,

                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (BuildContext context,
                                              int index) {

                                            return new Padding(
                                              padding:
                                              const EdgeInsets.all(5.0),

                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => StateDistrictWise(StateName: '${filterData[index].state}',
                                                            confirmed: '${filterData[index].confirmed}',
                                                            recovered: '${filterData[index].recovered}',
                                                            active: '${filterData[index].active}',
                                                            deaths: '${filterData[index].deaths}',
                                                          )));
//                                                  showDialog(context: context, child:
//                                                  new AlertDialog(
//                                                    title: new Text("My Super title"),
//                                                    content: new Text("Hello World"),
//                                                  )
//                                                  );
                                                },



                                                child: new Container(
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
                                                   child:   CasesCardList(
                                                     state : '${filterData[index].state}',
                                                     active :'${filterData[index].active}',
                                                     confirmed:'${filterData[index].confirmed}',
                                                     recovered:'${filterData[index].recovered}',
                                                     death:'${filterData[index].deaths}',
                                                   ),
                                                ),
                                              ),
                                            );

                                          },
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
        ));
  }
}

class ItemList extends StatelessWidget {
  final List countryList;

  ItemList({this.countryList});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: countryList == null ? 0 : countryList.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute()),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  "State : ${countryList[i].state}",
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                leading: new Icon(Icons.widgets),
                subtitle: new Text(
                  "Contact : ${countryList[i].active}",
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 1,
          colors: [Color(0xff4E56C1),Color(0xff7B80DB),Color(0xff696AE0)],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}