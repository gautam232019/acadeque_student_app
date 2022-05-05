import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();

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

  String? token;

  onSubmit(context) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userName, password: password);
      if (FirebaseAuth.instance.currentUser != null) {
        final token = await FirebaseAuth.instance.currentUser!.getIdToken();
        this.token = token;
        print(token);
        notifyListeners();
      }
      if (response.user!.emailVerified == false) {
        ToastService().w("Please verify your email!");
        return;
      }
      if (FirebaseAuth.instance.currentUser != null) {
        final token = await FirebaseAuth.instance.currentUser!.getIdToken();
        this.token = token;
        print(token);
        notifyListeners();
      }
      onFinalSubmit(context);
      // ignore: empty_catches
    } catch (err) {
      ToastService().e(err.toString());
    }
  }

  onFinalSubmit(context) async {
    try {
      String? name = LocalStorageService().read(LocalStorageKeys.userName);
      String? storedEmail = LocalStorageService().read(LocalStorageKeys.email);
      if (storedEmail == userName) {
        final response = await dio.get(
            "/auth/provider?user=student&provider=password&idToken=$token&name=$name");
        print(response.data);
      } else {
        // final response = await dio.get(
        // "/auth/provider?user=student&provider=password&idToken=$token");
        // print(response.data);
      }
      // ignore: empty_catches
    } catch (err) {}
  }

  // onSubmit(context) async {
  //   setLoading(true);
  //   if (formKey.currentState!.validate()) {
  //     var data = {
  //       "email": userName,
  //       "password": password,
  //     };
  //     try {
  //       final response = await dio.post("auth/login?user=student", data: data);
  //       LocalStorageService()
  //           .write(LocalStorageKeys.accessToken, response.data["data"]);

  //       Navigator.pushReplacementNamed(context, '/splash');
  //       // ignore: empty_catches
  //     } catch (err) {}
  //   }
  //   setLoading(false);
  // }
}
