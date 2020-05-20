class IndiaModelList{
  List<IndiaModel> IndiaModellist;


  IndiaModelList.fromJson(Map<String, dynamic> json) {

    if (json['statewise'] != null) {
      IndiaModellist = new List<IndiaModel>();
      json['statewise'].forEach((v) {
        IndiaModellist.add(new IndiaModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.IndiaModellist != null) {
      data['statewise'] = this.IndiaModellist.map((v) => v.toJson()).toList();
    }
    return data;
  }

}


class IndiaModel{
  String state, confirmed,active,deaths,recovered;
  IndiaModel({this.state,this.confirmed,this.active,this.deaths,this.recovered});
  IndiaModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    confirmed = json['confirmed'];
    active = json['active'];
    deaths = json['deaths'];
    recovered=json['recovered'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state']=  this.state;
    data['confirmed']= this.confirmed ;
    data['active']= this.active ;
    data['deaths']=this.deaths;
    data['recovered']=this.recovered;

    return data;
  }




}



