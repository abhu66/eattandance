import 'dart:convert';

class LoginRes {
  String id;
  String name;
  String employeeId;
  String email;
  String username;
  String phone;
  String token;
  String date;


  LoginRes({this.id,this.name, this.employeeId, this.email, this.username, this.phone,
      this.token, this.date});


  factory LoginRes.fromJson(Map<String, dynamic> map) {
    return LoginRes(
        id        : map['id'],
        name      : map['name'],
        employeeId: map['employeeId'],
        email     : map['email'],
        username  : map['username'],
        phone     : map['phone'],
        token     : map['token'],
        date      : map['date']);
  }
  // sementara
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id']           = id;
    map['name']         = name;
    map['employeeId']   = employeeId;
    map['email']        = email;
    map['username']     = username;
    map['phone']        = phone;
    map['token']        = token;
    map['date']         = date;
    return map;
  }

  LoginRes.map(dynamic obj) {
    this.id         = obj["id"];
    this.name       = obj["name"];
    this.employeeId = obj["employeeId"];
    this.email      = obj["email"];
    this.username   = obj["username"];
    this.phone      = obj["phone"];
    this.token      = obj["token"];
    this.date       = obj["date"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name":name,
      "employeeId": employeeId,
      "email":email,
      "username": username,
      "phone":phone,
      "token": token,
      "date": date
    };
  }
  @override
  String toString() {
    return 'LoginRes{id: $id, employeeId: $employeeId,email:$email,username: $username,phone: $phone, token: $token, date: $date}';
  }
}

LoginRes loginResFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return LoginRes.map(data);
}
