class StateDistrictWiseModelList{
  List<StateDistrictWiseModelListModel> StateDistrictWiseModel_List;


  StateDistrictWiseModelList.fromJson(Map<String, dynamic> json,String statename) {
    var districtSateData=json[statename];
    var districtData=districtSateData['districtData'];
    print("datat=>"+districtData.toString());
    List<Map<String, dynamic>> _list = [];
    districtData.forEach((k,v) {
       _list.add({'city' : '${k}' , 'cases' : districtSateData['districtData']['$k']['confirmed'].toString() });

    });


    if (_list!= null) {
      StateDistrictWiseModel_List = new List<StateDistrictWiseModelListModel>();
      _list.forEach((v) {
        StateDistrictWiseModel_List.add(new StateDistrictWiseModelListModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.StateDistrictWiseModel_List != null) {
      data['districtData'] = this.StateDistrictWiseModel_List.map((v) => v.toJson()).toList();
    }
    return data;
  }

}


class StateDistrictWiseModelListModel{
  String city, cases;

  StateDistrictWiseModelListModel({this.city,this.cases});
  StateDistrictWiseModelListModel.fromJson(Map<String, dynamic> json) {

    city = json['city'];
    cases = json['cases'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city']=  this.city;
    data['cases']= this.cases ;

    return data;
  }




}



