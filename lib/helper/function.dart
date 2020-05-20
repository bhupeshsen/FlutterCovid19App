import 'dart:convert';
import 'package:coronapp/modelclass/CountryView.dart';
import 'package:coronapp/modelclass/IndiaView.dart';
import 'package:coronapp/modelclass/state_district_wise.dart';
import 'package:http/http.dart' as http;


const String TMDB_API_BASE_URL_two = "https://coronavirus-19-api.herokuapp.com/";

const String TMDB_API_BASE_URL = "https://api.covid19india.org/";

Future<List<CountryModel>> feteCountryData(String api) async{
  CountryModelList countryList;

//  var  response = await dio.get('$TMDB_API_BASE_URL$api');
  var res = await http.get('$TMDB_API_BASE_URL_two$api');
   //var decodeRes =parsePhotos(res.body);//jsonDecode(res.body);

   List<CountryModel> countrydata=parsePhotos(res.body);

  print("countrydatalent"+countrydata.length.toString());
  // countryList = CountryModelList.fromJson(decodeRes);

  return countrydata;
}
List<CountryModel> parsePhotos(String responseBody) {
final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
return parsed.map<CountryModel>((json) => CountryModel.fromJson(json)).toList();
}

Future<List<IndiaModel>> fetchIndidata(String api) async{
  IndiaModelList countryList;

//  var  response = await dio.get('$TMDB_API_BASE_URL$api');
  var res = await http.get('$TMDB_API_BASE_URL$api');

  var decodeRes =jsonDecode(res.body);

  countryList = IndiaModelList.fromJson(decodeRes);

  return countryList.IndiaModellist;
}



Future<List<StateDistrictWiseModelListModel>> stateDistrictWise(String api,String sateName) async{
  StateDistrictWiseModelList cityList;

//  var  response = await dio.get('$TMDB_API_BASE_URL$api');
  //var res = await http.get("http://bhssolution.com/testJson.json");

  var res = await http.get('$TMDB_API_BASE_URL$api');

  var decodeRes =jsonDecode(res.body);



//  districtData.forEach((k, v) {
//
//    print("$k: $v");
//    print("$k: $v");
//
//  });




//    Map<String, dynamic> myMap = json.decode(res.body);
//    List<dynamic> entitlements = myMap["Entitlements"];
//  print("entitlements"+entitlements.toString());
//    entitlements.forEach((entitlement) {
//      (entitlement as Map<String, dynamic>).forEach((key, value) {
//        print("city name"+key);
//        try {
//          (value as Map<String, dynamic>).forEach((key2, value2 ) {
//            print(key2);
//           // print("dtrictis"+key2+"="+value2.toString());
//            //print(value2);
//          });
//        } on Exception catch (e, s) {
//          print(s);
//        }
//      });
//    });






  cityList = StateDistrictWiseModelList.fromJson(decodeRes,sateName);

  return cityList.StateDistrictWiseModel_List;
}