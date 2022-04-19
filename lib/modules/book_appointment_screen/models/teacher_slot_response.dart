class TeacherSlotResponse {
  String? status;
  Data? data;

  TeacherSlotResponse({this.status, this.data});

  TeacherSlotResponse.fromJson(Map<String, dynamic> json) {
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
  String? from;
  String? to;
  List<Slots>? slots;

  Data({this.from, this.to, this.slots});

  Data.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(new Slots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    if (this.slots != null) {
      data['slots'] = this.slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slots {
  int? from;
  int? to;
  bool? available;

  Slots({this.from, this.to, this.available});

  Slots.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['available'] = this.available;
    return data;
  }
}
