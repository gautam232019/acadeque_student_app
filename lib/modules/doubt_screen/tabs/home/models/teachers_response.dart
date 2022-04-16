class TeachersResponse {
  String? status;
  int? result;
  Data? data;

  TeachersResponse({this.status, this.result, this.data});

  TeachersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Teachers>? teachers;

  Data({this.teachers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(new Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
  String? sId;
  String? name;
  String? role;
  String? email;
  String? work;
  // List<Null>? subjects;
  int? avgRating;
  bool? enableInstantSession;
  bool? disabled;
  String? createdAt;
  int? iV;
  String? description;
  int? hourlyRate;

  Teachers(
      {this.sId,
      this.name,
      this.role,
      this.email,
      this.work,
      // this.subjects,
      this.avgRating,
      this.enableInstantSession,
      this.disabled,
      this.createdAt,
      this.iV,
      this.description,
      this.hourlyRate});

  Teachers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    work = json['work'];
    // if (json['subjects'] != null) {
    //   subjects = <Null>[];
    //   json['subjects'].forEach((v) {
    //     subjects!.add(new Null.fromJson(v));
    //   });
    // }
    avgRating = json['avgRating'];
    enableInstantSession = json['enableInstantSession'];
    disabled = json['disabled'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    description = json['description'];
    hourlyRate = json['hourlyRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['role'] = this.role;
    data['email'] = this.email;
    data['work'] = this.work;
    // if (this.subjects != null) {
    //   data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    // }
    data['avgRating'] = this.avgRating;
    data['enableInstantSession'] = this.enableInstantSession;
    data['disabled'] = this.disabled;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['description'] = this.description;
    data['hourlyRate'] = this.hourlyRate;
    return data;
  }
}
