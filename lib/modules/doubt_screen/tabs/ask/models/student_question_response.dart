class StudentQuestionResponse {
  String? status;
  num? results;
  Data? data;

  StudentQuestionResponse({this.status, this.results, this.data});

  StudentQuestionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Questions>? questions;

  Data({this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? sId;
  String? studentId;
  SubjectId? subjectId;
  String? question;
  bool? solved;
  String? createdAt;
  String? mediaURL;

  Questions(
      {this.sId,
      this.studentId,
      this.subjectId,
      this.question,
      this.solved,
      this.createdAt,
      this.mediaURL});

  Questions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentId = json['studentId'];
    subjectId = json['subjectId'] != null
        ? new SubjectId.fromJson(json['subjectId'])
        : null;
    question = json['question'];
    solved = json['solved'];
    createdAt = json['createdAt'];
    mediaURL = json['mediaURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['studentId'] = this.studentId;
    if (this.subjectId != null) {
      data['subjectId'] = this.subjectId!.toJson();
    }
    data['question'] = this.question;
    data['solved'] = this.solved;
    data['createdAt'] = this.createdAt;
    data['mediaURL'] = this.mediaURL;
    return data;
  }
}

class SubjectId {
  String? sId;
  CourseId? courseId;
  String? name;

  SubjectId({this.sId, this.courseId, this.name});

  SubjectId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseId = json['courseId'] != null
        ? new CourseId.fromJson(json['courseId'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.courseId != null) {
      data['courseId'] = this.courseId!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class CourseId {
  String? sId;
  String? name;

  CourseId({this.sId, this.name});

  CourseId.fromJson(Map<String, dynamic> json) {
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
