import 'dart:convert';

class CharecterModel{
  CharecterModel({this.details});
  List<CharecterDetailSModel>? details;

  factory CharecterModel.fromJson(List<dynamic> json){
   return CharecterModel(
        details: json.map((e) => CharecterDetailSModel.fromJson(e as Map<String,dynamic>)).toList()
      );

  }


}


class CharecterDetailSModel{
 CharecterDetailSModel({
    this.name,
    this.birthday,
    this.img,
  });

  String? name;
  String? birthday;
  String? img;

  factory CharecterDetailSModel.fromJson(Map<String, dynamic> json) => CharecterDetailSModel(
        name: json["name"],
        birthday: json["birthday"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthday": birthday,
        "img": img,
      };
}
