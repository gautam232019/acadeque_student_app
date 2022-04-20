class TeachersResponse {
  String? status;
  num? result;
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
  String? authProvider;
  String? role;
  String? email;
  String? work;
  List<String>? subjects;
  num? hourlyRate;
  num? minuteRate;
  num? avgRating;
  bool? enableInstantSession;
  bool? disabled;
  bool? approved;
  String? createdAt;
  num? iV;
  String? description;
  Experience? experience;
  num? students;

  Teachers(
      {this.sId,
      this.name,
      this.authProvider,
      this.role,
      this.email,
      this.work,
      this.subjects,
      this.hourlyRate,
      this.minuteRate,
      this.avgRating,
      this.enableInstantSession,
      this.disabled,
      this.approved,
      this.createdAt,
      this.iV,
      this.description,
      this.experience,
      this.students});

  Teachers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    authProvider = json['authProvider'];
    role = json['role'];
    email = json['email'];
    work = json['work'];
    subjects = json['subjects'].cast<String>();
    hourlyRate = json['hourlyRate'];
    minuteRate = json['minuteRate'];
    avgRating = json['avgRating'];
    enableInstantSession = json['enableInstantSession'];
    disabled = json['disabled'];
    approved = json['approved'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    description = json['description'];
    experience = json['experience'] != null
        ? new Experience.fromJson(json['experience'])
        : null;
    students = json['students'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['authProvider'] = this.authProvider;
    data['role'] = this.role;
    data['email'] = this.email;
    data['work'] = this.work;
    data['subjects'] = this.subjects;
    data['hourlyRate'] = this.hourlyRate;
    data['minuteRate'] = this.minuteRate;
    data['avgRating'] = this.avgRating;
    data['enableInstantSession'] = this.enableInstantSession;
    data['disabled'] = this.disabled;
    data['approved'] = this.approved;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['description'] = this.description;
    if (this.experience != null) {
      data['experience'] = this.experience!.toJson();
    }
    data['students'] = this.students;
    return data;
  }
}

class Experience {
  String? numberDecimal;

  Experience({this.numberDecimal});

  Experience.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['$numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberDecimal'] = this.numberDecimal;
    return data;
  }
}
