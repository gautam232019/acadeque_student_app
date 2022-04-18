class userDetailResponse {
  String? status;
  Data? data;

  userDetailResponse({this.status, this.data});

  userDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Student? student;

  Data({this.student});

  Data.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  String? sId;
  String? name;
  String? email;
  dynamic contact;

  Student({this.sId, this.name, this.email, this.contact});

  Student.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'] != null ? json['contact'].toString() : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    return data;
  }
}
