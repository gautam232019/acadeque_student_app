import 'dart:convert';

import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();

  String userName = "";
  String password = "";

  onUserNameChange(val) {
    userName = val;
    notifyListeners();
  }

  onPasswordChange(val) {
    password = val;
    notifyListeners();
  }

  onSubmit() async {
    setLoading(true);
    if (formKey.currentState!.validate()) {
      var data = {
        "email": userName,
        "password": password,
      };
      try {
        final response = await dio.post("auth/login?user=student", data: data);
        LocalStorageService()
            .write(LocalStorageKeys.accessToken, response.data["data"]);
        navigatorKey.currentState?.pushReplacementNamed('/splash');

        print(response.data);
      } catch (err) {}
    }
    setLoading(false);
  }
}
