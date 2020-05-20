

import 'package:coronapp/constant.dart';
import 'package:coronapp/helper/function.dart';
import 'package:coronapp/info_screen.dart';
import 'package:coronapp/modelclass/state_district_wise.dart';
import 'package:coronapp/prevensytrom.dart';
import 'package:coronapp/widgets/counter.dart';
import 'package:coronapp/widgets/my_header.dart';
import 'package:flutter/material.dart';


class StateDistrictWise extends StatefulWidget {

  String StateName="",confirmed="",recovered="",deaths="",active="";
  _StateDistrictWise createState() => new _StateDistrictWise();

  StateDistrictWise({this.StateName,this.confirmed,this.recovered,this.deaths,this.active});
}


class _StateDistrictWise extends State<StateDistrictWise>{
  Widget _buildCard(String name, String status, int cardIndex, Colorsget) {
    return Container(
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(5),
//        color: Colors.white,
//        boxShadow: [
//          BoxShadow(
//            offset: Offset(0, 4),
//            blurRadius: 30,
//            color: kShadowColor,
//          ),
//        ],
//      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFE8505B),
              Color(0xFFCB4650),
            ],
          )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 20.0),
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
  TextEditingController editingController = TextEditingController();
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
  List<StateDistrictWiseModelListModel> stateDistrictList;
  List<StateDistrictWiseModelListModel> filterData;
  @override
  void initState() {
    super.initState();
    //getData();
    stateDistrictWise("state_district_wise.json",widget.StateName).then((value) {
      setState(() {
        stateDistrictList=value;
        filterData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: Text("State District Data"),

        backgroundColor: primaryColor,
      ),
        body: Container(
      child:   ListView(
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
                  height: 250.0,
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
                  child: Wrap(

                    children: <Widget>[
                      SizedBox(height: 5.0),
                      Padding(
                          padding:
                          EdgeInsets.all(10),
                        child:  Column(
                           children: <Widget>[
                             SizedBox(height: 20),


                             Container(
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
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Colors.white,
                                   boxShadow: [
                                     BoxShadow(
                                       offset: Offset(0, 4),
                                       blurRadius: 30,
                                       color: kShadowColor,
                                     ),
                                   ],
                                 ),
                                 padding: EdgeInsets.all(
                                     10),
                                 child: Column(
                                   children: <Widget>[
                                     Align(
                                       alignment: Alignment
                                           .centerLeft,
                                       child: Column(
                                         children: <Widget>[
                                           Padding(
                                             padding:
                                             EdgeInsets
                                                 .fromLTRB(
                                                 5,
                                                 10,
                                                 10,
                                                 10),
                                             child: Text(
                                               widget.StateName,
                                               style: TextStyle(
                                                   fontFamily:
                                                   'Quicksand',
                                                   fontSize:
                                                   14.0,
                                                   fontWeight:
                                                   FontWeight
                                                       .bold),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                     Row(
                                       crossAxisAlignment:
                                       CrossAxisAlignment
                                           .center,
                                       children: [
                                         Expanded(
                                           child: Padding(
                                             padding:
                                             EdgeInsets
                                                 .fromLTRB(
                                                 5,
                                                 5,
                                                 5,
                                                 5),
                                             child: Column(
                                               children: <
                                                   Widget>[
                                                 Text(
                                                   'CONFIRMED',
                                                   style: TextStyle(
                                                       fontFamily:
                                                       'Quicksand',
                                                       fontSize:
                                                       12,
                                                       color: Colors
                                                           .red,
                                                       fontWeight:
                                                       FontWeight.bold),
                                                 ),
                                                 SizedBox(
                                                     height:
                                                     2.0),
                                                 Text(
                                                      widget.confirmed,
                                                   style: TextStyle(
                                                       fontFamily:
                                                       'Quicksand',
                                                       fontSize:
                                                       15,
                                                       fontWeight:
                                                       FontWeight.bold),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),
                                         Expanded(
                                             child: Padding(
                                               padding: EdgeInsets
                                                   .fromLTRB(
                                                   5, 5, 5, 5),
                                               child: Column(
                                                 children: <
                                                     Widget>[
                                                   Text(
                                                     'ACTIVE',
                                                     style: TextStyle(
                                                         fontFamily:
                                                         'Quicksand',
                                                         fontSize:
                                                         12,
                                                         color: Colors
                                                             .blue,
                                                         fontWeight:
                                                         FontWeight
                                                             .bold),
                                                   ),
                                                   SizedBox(
                                                       height:
                                                       2.0),
                                                   Text(
                                                     widget.active,
                                                     style: TextStyle(
                                                         fontFamily:
                                                         'Quicksand',
                                                         fontSize:
                                                         15,
                                                         fontWeight:
                                                         FontWeight
                                                             .bold),
                                                   ),
                                                 ],
                                               ),
                                             )),
                                         Expanded(
                                             child: Padding(
                                               padding: EdgeInsets
                                                   .fromLTRB(
                                                   5, 5, 5, 5),
                                               child: Column(
                                                 children: <
                                                     Widget>[
                                                   Text(
                                                     'RECOVERED',
                                                     style: TextStyle(
                                                         fontFamily:
                                                         'Quicksand',
                                                         fontSize:
                                                         12,
                                                         color: Colors
                                                             .green,
                                                         fontWeight:
                                                         FontWeight
                                                             .bold),
                                                   ),
                                                   SizedBox(
                                                       height:
                                                       2.0),
                                                   Text(
                                                     widget.recovered,
                                                     style: TextStyle(
                                                         fontFamily:
                                                         'Quicksand',
                                                         fontSize:
                                                         15,
                                                         fontWeight:
                                                         FontWeight
                                                             .bold),
                                                   ),
                                                 ],
                                               ),
                                             )),
                                         Expanded(
                                             child: Padding(
                                                 padding: EdgeInsets
                                                     .fromLTRB(
                                                     5,
                                                     5,
                                                     5,
                                                     5),
                                                 child: Column(
                                                   children: <
                                                       Widget>[
                                                     Text(
                                                       'DECEASED',
                                                       style: TextStyle(
                                                           fontFamily:
                                                           'Quicksand',
                                                           fontSize:
                                                           12,
                                                           color:
                                                           Colors.grey,
                                                           fontWeight: FontWeight.bold),
                                                     ),
                                                     SizedBox(
                                                         height:
                                                         2.0),
                                                     Text(
                                                        widget.deaths,
                                                       style: TextStyle(
                                                           fontFamily:
                                                           'Quicksand',
                                                           fontSize:
                                                           15,
                                                           fontWeight:
                                                           FontWeight.bold),
                                                     ),
                                                   ],
                                                 ))),
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                             ),
                             SizedBox(height: 10),



                           ],
                        )
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
                                  filterData = stateDistrictList
                                      .where((u) => (u.cases
                                      .toLowerCase()
                                      .contains(value
                                      .toLowerCase()) ||
                                      u.city
                                          .toLowerCase()
                                          .contains(value
                                          .toLowerCase())))
                                      .toList();
                                });
                              },
                              controller: editingController,
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
                      SizedBox(
                        width: double.infinity,
                        height: 500,
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
                              const EdgeInsets.all(10.0),

                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          //builder: (context) => CoronaInfo()
                                      ));
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
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 4),
                                            blurRadius: 10,
                                            color: kShadowColor,
                                          ),
                                        ],
                                      ),
                                    padding: EdgeInsets.fromLTRB(
                                        5, 10, 10, 10),
                                    child: Column(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment
                                              .centerLeft,
                                          child: Column(
                                            children: <Widget>[

                                            ],
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          children: [

                                            Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .fromLTRB(
                                                      5, 5, 5, 5),
                                                  child: Column(
                                                    children: <
                                                        Widget>[

                                                      Counter(
                                                        color: kRecovercolor,
                                                        number: '${filterData[index].city}',
                                                        title: "City",
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .fromLTRB(
                                                      5, 5, 5, 5),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Counter(
                                                        color: kDeathColor,
                                                        number: '${filterData[index].cases}',
                                                        title: "Cases",
                                                      )
                                                    ],
                                                  ),
                                                )),

                                          ],
                                        )
                                      ],
                                    ),
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
      ),
    );
  }

}