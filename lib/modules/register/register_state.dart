import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RegisterState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();

  String userName = "";
  String email = "";
  String password = "";

  onUserNameChange(val) {
    userName = val;
    notifyListeners();
  }

  onEmailChange(val) {
    email = val;
    notifyListeners();
  }

  onPasswordChange(val) {
    password = val;
    notifyListeners();
  }

  onSubmit(context) async {
    setLoading(true);
    if (formKey.currentState!.validate()) {
      var data = {
        "name": userName,
        "email": email,
        "password": password,
      };
      try {
        final response = await dio.post("/students", data: data);
        ToastService().s("Account created successfully!");
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } catch (err) {}
    }

    setLoading(false);
  }
}
