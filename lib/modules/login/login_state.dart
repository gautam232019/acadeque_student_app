import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();

  Future googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth == null) return;
      print("yo token ho");
      print(googleAuth.idToken);
      // ignore: empty_catches
    } catch (err) {
      print(err);
    }
  }

  bool hidePassword = true;

  changeVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

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
