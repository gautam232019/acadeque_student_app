import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();

  bool hidePassword = true;

  changeVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

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

  String? token;

  onSubmit(context) async {
    setLoading(true);
    if (userName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      try {
        final result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        result.user!.sendEmailVerification();
        ToastService().s("Successfully registered!");
        LocalStorageService().write(LocalStorageKeys.userName, userName);
        LocalStorageService().write(LocalStorageKeys.email, email);
        Navigator.pop(context);
      } catch (err) {
        ToastService().e(err.toString());
      }
    } else {
      ToastService().w("Please provide all fields!");
    }
    setLoading(false);
  }
}
