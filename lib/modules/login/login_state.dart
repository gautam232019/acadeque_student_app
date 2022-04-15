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

  onSubmit(context) async {
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

        Navigator.pushReplacementNamed(context, '/splash');
        // ignore: empty_catches
      } catch (err) {}
    }
    setLoading(false);
  }
}
