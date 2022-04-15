import 'dart:convert';

import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/models/user_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';

class UserResponse {
  String? userId;
  String? role;
  dynamic iat;
  dynamic exp;

  UserResponse({this.userId, this.role, this.iat, this.exp});

  UserResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    role = json['role'];
    iat = json['iat'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['iat'] = this.iat;
    data['exp'] = this.exp;
    return data;
  }
}

class DoubtState extends BaseState {
  int bottomIndex = 0;
  onBottomItemTapped(int index, context) {
    bottomIndex = index;
    notifyListeners();
  }
}
