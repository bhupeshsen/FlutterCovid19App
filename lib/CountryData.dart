

import 'package:coronapp/constant.dart';
import 'package:coronapp/helper/function.dart';
import 'package:coronapp/modelclass/CountryView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'All_Widget/widgetclass.dart';

class CountryData extends StatefulWidget{

  _CountryData createState() =>new _CountryData();
}

class _CountryData extends State<CountryData>{
  List<CountryModel> countryList;
  List<CountryModel> filterData;

  TextEditingController controllerName = new TextEditingController();
  @override
  void initState() {
    super.initState();
    //getData();
    feteCountryData("countries").then((value) {
      setState(() {
        countryList = value;
        filterData=value;
        countryList.sort((b, a) => a.cases.compareTo(b.cases));
        filterData.sort((b, a) => a.cases.compareTo(b.cases));
        print("datacountryshow"+value.toString());

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: AppBar(
          title: Text("WORLD-COVID-19-CASES"),

          backgroundColor: primaryColor,
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
                      height: 250.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE8505B),
                              Color(0xFFE8505B),
                            ],
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10.0),
                         Padding(padding: EdgeInsets.all(5),
                         child: CasesCardTopList(
                           state : 'Total Cases',
                           active :'${countryList[0].active}',
                           confirmed:'${countryList[0].cases}',
                           recovered:'${countryList[0].recovered}',
                           death:'${countryList[0].deaths}',
                         ),
                         ),
                          SizedBox(height: 20.0),

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

                                      child:   Column(
                                        children: <Widget>[

                                          CasesCardCountryList(
                                            state : filterData[index].country=controllerName.text,
                                            active :'${filterData[index].active}',
                                            confirmed:'${filterData[index].cases}',
                                            recovered:'${filterData[index].recovered}',
                                            death:'${filterData[index].deaths}',
                                            todayCases:'${filterData[index].todayCases}',
                                            todayDeaths:'${filterData[index].todayDeaths}',
                                            critical:'${filterData[index].critical}',
                                          ),
                                        ],
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