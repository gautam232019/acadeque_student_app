class BookingAppointmentResponse {
  String? status;
  Data? data;

  BookingAppointmentResponse({this.status, this.data});

  BookingAppointmentResponse.fromJson(Map<String, dynamic> json) {
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
  String? cftoken;
  Order? order;
  Appointment? appointment;

  Data({this.cftoken, this.order, this.appointment});

  Data.fromJson(Map<String, dynamic> json) {
    cftoken = json['cftoken'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    appointment = json['appointment'] != null
        ? new Appointment.fromJson(json['appointment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cftoken'] = this.cftoken;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.appointment != null) {
      data['appointment'] = this.appointment!.toJson();
    }
    return data;
  }
}

class Order {
  String? payBy;
  String? payTo;
  int? amount;
  String? currency;
  Orders? orders;
  String? status;
  String? createdAt;
  String? sId;
  int? iV;

  Order(
      {this.payBy,
      this.payTo,
      this.amount,
      this.currency,
      this.orders,
      this.status,
      this.createdAt,
      this.sId,
      this.iV});

  Order.fromJson(Map<String, dynamic> json) {
    payBy = json['payBy'];
    payTo = json['payTo'];
    amount = json['amount'];
    currency = json['currency'];
    orders =
        json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    status = json['status'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payBy'] = this.payBy;
    data['payTo'] = this.payTo;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class Orders {
  String? appointmentId;

  Orders({this.appointmentId});

  Orders.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentId'] = this.appointmentId;
    return data;
  }
}

class Appointment {
  String? type;
  String? studentId;
  String? teacherId;
  String? from;
  String? to;
  int? duration;
  String? status;
  String? createdAt;
  String? sId;
  int? iV;
  String? orderId;

  Appointment(
      {this.type,
      this.studentId,
      this.teacherId,
      this.from,
      this.to,
      this.duration,
      this.status,
      this.createdAt,
      this.sId,
      this.iV,
      this.orderId});

  Appointment.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    studentId = json['studentId'];
    teacherId = json['teacherId'];
    from = json['from'];
    to = json['to'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    iV = json['__v'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['studentId'] = this.studentId;
    data['teacherId'] = this.teacherId;
    data['from'] = this.from;
    data['to'] = this.to;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    data['orderId'] = this.orderId;
    return data;
  }
}
