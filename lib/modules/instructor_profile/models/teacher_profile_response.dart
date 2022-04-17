class TeacherProfileResponse {
  String? status;
  Data? data;

  TeacherProfileResponse({this.status, this.data});

  TeacherProfileResponse.fromJson(Map<String, dynamic> json) {
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
  Teacher? teacher;

  Data({this.teacher});

  Data.fromJson(Map<String, dynamic> json) {
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}

class Teacher {
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
  String? description;
  int? hourlyRate;

  Teacher(
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
      this.description,
      this.hourlyRate});

  Teacher.fromJson(Map<String, dynamic> json) {
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
    data['description'] = this.description;
    data['hourlyRate'] = this.hourlyRate;
    return data;
  }
}
