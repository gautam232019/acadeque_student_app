class TeacherReviewResponse {
  String? status;
  int? result;
  Data? data;

  TeacherReviewResponse({this.status, this.result, this.data});

  TeacherReviewResponse.fromJson(Map<String, dynamic> json) {
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
  List<Reviews>? reviews;

  Data({this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? sId;
  StudentId? studentId;
  String? teacherId;
  String? ratedToRef;
  String? ratedTo;
  String? satisfaction;
  double? rating;
  String? feedback;
  String? createdAt;

  Reviews(
      {this.sId,
      this.studentId,
      this.teacherId,
      this.ratedToRef,
      this.ratedTo,
      this.satisfaction,
      this.rating,
      this.feedback,
      this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentId = json['studentId'] != null
        ? new StudentId.fromJson(json['studentId'])
        : null;
    teacherId = json['teacherId'];
    ratedToRef = json['ratedToRef'];
    ratedTo = json['ratedTo'];
    satisfaction = json['satisfaction'];
    rating = json['rating'];
    feedback = json['feedback'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.studentId != null) {
      data['studentId'] = this.studentId!.toJson();
    }
    data['teacherId'] = this.teacherId;
    data['ratedToRef'] = this.ratedToRef;
    data['ratedTo'] = this.ratedTo;
    data['satisfaction'] = this.satisfaction;
    data['rating'] = this.rating;
    data['feedback'] = this.feedback;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class StudentId {
  String? sId;
  String? name;

  StudentId({this.sId, this.name});

  StudentId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
