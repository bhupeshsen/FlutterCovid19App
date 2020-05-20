class CountryModelList{
  List<CountryModel> CountryModellist;


  CountryModelList.fromJson(Map<String, dynamic> json) {
    print("country=>"+json.toString());
    List<Map<String, dynamic>> _list = [];
    json.forEach((k,v) {
      _list.add({'city' : '${k}' , 'cases' : '${k}' });

    });
//    if (json['results'] != null) {
//      CountryModellist = new List<CountryModel>();
//      json['results'].forEach((v) {
//        CountryModellist.add(new CountryModel.fromJson(v));
//      });
//    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.CountryModellist != null) {
      data['results'] = this.CountryModellist.map((v) => v.toJson()).toList();
    }
    return data;
  }

}


class CountryModel{
  String country;
  int cases,todayCases,deaths,todayDeaths,recovered,active,critical;
  CountryModel({this.country,this.cases,this.todayCases,this.deaths,this.todayDeaths,this.recovered,this.active,this.critical});
  CountryModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths=json['todayDeaths'];
    recovered = json['recovered'];
    active= json['active'];
    critical = json['critical'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country']=  this.country;
    data['cases']= this.cases ;
    data['todayCases']= this.todayCases ;
    data['deaths']=this.deaths;
    data['todayDeaths']=this.todayDeaths;
    data['recovered']=this.recovered;
    data['active']=this.active;
    data['critical']=this.critical;
    return data;
  }

}

class BookGetList{
  int page;
  int tottalbook;
  int totalpages;
  List<Book> Booklist;
  BookGetList({this.page, this.tottalbook, this.totalpages, this.Booklist});

  BookGetList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    tottalbook = json['total_results'];
    totalpages = json['total_pages'];
    if (json['results'] != null) {
      Booklist = new List<Book>();
      json['results'].forEach((v) {
        Booklist.add(new Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.tottalbook;
    data['total_pages'] = this.totalpages;
    if (this.Booklist != null) {
      data['results'] = this.Booklist.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Book{
  String id;
  String chapterSno;
  String subject_name;
  String book_code;
  String book_name;
  String classname;
  String chapter_no;
  String posterPath;
  String title;

  Book({
    this.id,
    this.subject_name,
    this.book_code,
    this.chapterSno,
    this.book_name,
    this.posterPath,
    this.classname,
    this.chapter_no,
    this.title

  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject_name = json['subject_name'];
    book_code = json['book_code'];
    book_name = json['book_name'];
    chapterSno=json['chapterSno'];
    classname = json['classname'];
    posterPath= json['posterPath'];
    chapter_no = json['chapter_no'];
    title = json['title'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']= this.id;
    data['subject_name']=  this.subject_name;
    data['book_code']= this.book_code ;
    data['posterPath']= this.posterPath ;
    data['book_name']=this.book_name;
    data['classname']=this.classname;
    data['chapterSno']=this.chapterSno;
    data['chapter_no']=this.chapter_no;
    data['title']=this.title;
    return data;
  }
}