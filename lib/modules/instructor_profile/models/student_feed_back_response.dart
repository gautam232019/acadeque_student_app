class StudentFeedBackResponse {
  String? status;
  Data? data;

  StudentFeedBackResponse({this.status, this.data});

  StudentFeedBackResponse.fromJson(Map<String, dynamic> json) {
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
  List<Satisfactions>? satisfactions;

  Data({this.satisfactions});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['satisfactions'] != null) {
      satisfactions = <Satisfactions>[];
      json['satisfactions'].forEach((v) {
        satisfactions!.add(new Satisfactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.satisfactions != null) {
      data['satisfactions'] =
          this.satisfactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Satisfactions {
  int? students;
  int? satisfied;
  int? percentage;

  Satisfactions({this.students, this.satisfied, this.percentage});

  Satisfactions.fromJson(Map<String, dynamic> json) {
    students = json['students'];
    satisfied = json['satisfied'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['students'] = this.students;
    data['satisfied'] = this.satisfied;
    data['percentage'] = this.percentage;
    return data;
  }
}
