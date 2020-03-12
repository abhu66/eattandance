


import 'dart:convert';

class CheckInRes {
  String id;
  String checkInAt;
  String checkOutAt;
  String comment;
  String latLong;
  String status;


  CheckInRes({this.id,this.checkInAt, this.checkOutAt, this.comment, this.latLong,this.status});


  factory CheckInRes.fromJson(Map<String, dynamic> map) {
    return CheckInRes(
        id              : map['id'],
        checkInAt       : map['checkInAt'],
        checkOutAt      : map['checkOutAt'],
        comment         : map['comment'],
        latLong         : map['latLong'],
        status          : map['status']
    );
  }
  // sementara
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id']           = id;
    map['checkInAt']    = checkInAt;
    map['checkOutAt']   = checkOutAt;
    map['comment']      = comment;
    map['latLong']       = latLong;
    map['status']       = status;
    return map;
  }

  CheckInRes.map(dynamic obj) {
    this.id         = obj["id"];
    this.checkInAt  = obj["checkInAt"];
    this.checkOutAt = obj["checkOutAt"];
    this.comment    = obj["comment"];
    this.latLong    = obj["latLong"];
    this.status     = obj["status"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "checkInAt":checkInAt,
      "checkOutAt": checkOutAt,
      "comment":comment,
      "latLong": latLong,
      "status" : status,
    };
  }
  @override
  String toString() {
    return 'CheckInRes{id: $id, checkInAt: $checkInAt,checkOutAt:$checkOutAt,comment: $comment,location: $latLong,status : $status}';
  }
}

CheckInRes checkInResFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return CheckInRes.map(data);
}
