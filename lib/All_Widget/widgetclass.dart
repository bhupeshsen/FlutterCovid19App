import 'package:coronapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CasesCard extends StatelessWidget {
  final String name;
  final String confirmed;
  final ColorName;

  const CasesCard({
    this.name,
    this.confirmed,
    this.ColorName
  });

  @override
  Widget build(BuildContext context) {
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
      child: Wrap(

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
                        color: ColorName,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    confirmed,
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
}

class CasesCardTopList extends StatelessWidget {
  final String state;
  final String active;
  final String confirmed;
  final String recovered;
  final String death;


  const CasesCardTopList({
    this.state,
    this.active,
    this.confirmed,
    this.recovered,
    this.death
  });

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Column(
        children: <Widget>[
//      Align(
//      alignment: Alignment
//          .centerLeft,
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding:
//              EdgeInsets
//                  .fromLTRB(
//                  5,
//                 5,
//                  5,
//                  5),
//              child: Text(
//                state,
//                style: TextStyle(
//                    fontFamily:
//                    'Quicksand',
//                    fontSize:
//                    16.0,
//                    fontWeight:
//                    FontWeight
//                        .bold),
//              ),
//            ),
//          ],
//        ),
//      ),
      Row(
        crossAxisAlignment:
        CrossAxisAlignment
            .center,
        children: [

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
                          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets
                    .fromLTRB(
                    5, 5, 5, 5),
                child: Column(
                  children: <
                      Widget>[
                    Text(
                      'CONFIRMED',
                      style: TextStyle(
                          fontFamily:
                          'Quicksand',
                          fontSize:
                          11,
                          color: Colors
                              .red,
                          fontWeight:
                          FontWeight.bold),
                    ),
                    SizedBox(
                        height:
                        2.0),
                    Text(
                      confirmed,
                      style: TextStyle(
                          fontFamily:
                          'Quicksand',
                          fontSize:
                          11,
                          fontWeight:
                          FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ),


          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
                          child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(5),
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
                            11,
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
                        active,
                        style: TextStyle(
                            fontFamily:
                            'Quicksand',
                            fontSize:
                            11,
                            fontWeight:
                            FontWeight
                                .bold),
                      ),
                    ],
                  ),
                )
            ),
            ),



          ),
          Expanded(
child: Padding(
  padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      )
                    ]

                ),
                padding: EdgeInsets.all(5),
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
                            11,
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
                        recovered,
                        style: TextStyle(
                            fontFamily:
                            'Quicksand',
                            fontSize:
                            11,
                            fontWeight:
                            FontWeight
                                .bold),
                      ),
                    ],
                  ),
                )
            ),

),

          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),

            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    )
                  ]

              ),
              padding: EdgeInsets.all(5),
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
                              11,
                              color:
                              Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            height:
                            2.0),
                        Text(
                          death,
                          style: TextStyle(
                              fontFamily:
                              'Quicksand',
                              fontSize:
                              11,
                              fontWeight:
                              FontWeight.bold),
                        ),
                      ],
                    ))
            ),
            ),


              ),
            ],
          ),
        ],
      ),
    );
  }
}


class CasesCardList extends StatelessWidget {
  final String state;
  final String active;
  final String confirmed;
  final String recovered;
  final String death;


  const CasesCardList({
    this.state,
    this.active,
    this.confirmed,
    this.recovered,
    this.death
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.fromLTRB(
          5, 10, 10, 10),
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
                    state,
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
                        confirmed,
                        style: TextStyle(
                            fontFamily:
                            'Quicksand',
                            fontSize:
                            13,
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
                          active,
                          style: TextStyle(
                              fontFamily:
                              'Quicksand',
                              fontSize:
                              13,
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
                          recovered,
                          style: TextStyle(
                              fontFamily:
                              'Quicksand',
                              fontSize:
                              13,
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
                            death,
                            style: TextStyle(
                                fontFamily:
                                'Quicksand',
                                fontSize:
                                13,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        ],
                      ))),
            ],
          ),

        ],
      ),
    );
  }
}


class CasesCardCountryList extends StatelessWidget {
  final String state;
  final String active;
  final String confirmed;
  final String recovered;
  final String death;

  final String todayCases;
  final String todayDeaths;
  final String critical;


  const CasesCardCountryList({
    this.state,
    this.active,
    this.confirmed,
    this.recovered,
    this.death,
    this.todayCases,
    this.todayDeaths,
    this.critical
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.fromLTRB(
          5, 10, 10, 10),

      child: Column(
        children: <Widget>[

          Column(
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
                        state,
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
                            confirmed,
                            style: TextStyle(
                                fontFamily:
                                'Quicksand',
                                fontSize:
                                13,
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
                              active,
                              style: TextStyle(
                                  fontFamily:
                                  'Quicksand',
                                  fontSize:
                                  13,
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
                              recovered,
                              style: TextStyle(
                                  fontFamily:
                                  'Quicksand',
                                  fontSize:
                                  13,
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
                                death,
                                style: TextStyle(
                                    fontFamily:
                                    'Quicksand',
                                    fontSize:
                                    13,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ],
                          ))),
                ],
              )

            ],
          ),
          Column(
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
                        "Today Case",
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
                        padding: EdgeInsets
                            .fromLTRB(
                            5, 5, 5, 5),
                        child: Column(
                          children: <
                              Widget>[
                            Text(
                              'CASE',
                              style: TextStyle(
                                  fontFamily:
                                  'Quicksand',
                                  fontSize:
                                  12,
                                  color: Colors
                                      .deepOrange,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                            ),
                            SizedBox(
                                height:
                                2.0),
                            Text(
                              todayCases,
                              style: TextStyle(
                                  fontFamily:
                                  'Quicksand',
                                  fontSize:
                                  13,
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
                              'DEATH',
                              style: TextStyle(
                                  fontFamily:
                                  'Quicksand',
                                  fontSize:
                                  12,
                                  color: Colors
                                      .lightGreen,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                            ),
                            SizedBox(
                                height:
                                2.0),
                            Text(
                              todayDeaths,
                              style: TextStyle(
                                  fontFamily:
                                  'Quicksand',
                                  fontSize:
                                  13,
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
                                'CRITICAL',
                                style: TextStyle(
                                    fontFamily:
                                    'Quicksand',
                                    fontSize:
                                    12,
                                    color:
                                    Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  height:
                                  2.0),
                              Text(
                                critical,
                                style: TextStyle(
                                    fontFamily:
                                    'Quicksand',
                                    fontSize:
                                    13,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ],
                          ))),
                ],
              )
            ],
          ),
        ],
      ),


    );
  }
}


class WidgetCompClass {


  Widget _stateCard(String name, String status, int cardIndex, Colorsget) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 3.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 30.0),
          Stack(children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
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

  _buildCard(String name, String status, int cardIndex, Colorsget) {
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

}



