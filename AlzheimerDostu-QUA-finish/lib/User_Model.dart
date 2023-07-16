
class UserModel {
  String? name;
  String? hasta_mail;
  String? hasta_bakici_mail;
  String? type;
  String?id;

  UserModel({this.name,this.hasta_mail,this.hasta_bakici_mail,this.type});


  Map<String, dynamic> toJson() => {
    'name': name,
    'hasta_mail':hasta_mail,
    'hasta_yakını':hasta_bakici_mail,
    'type': type
  };







}