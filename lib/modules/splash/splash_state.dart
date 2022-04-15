import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
// import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SplashState extends BaseState {
  Dio dio = getHttp();
  SplashState(context) {
    checkAndNavigate(context);
  }
  checkAndNavigate(context) async {
    try {
      String token =
          LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
      await Future.delayed(
        const Duration(seconds: 1),
      );

      if (token.isNotEmpty) {
        print("laod kha mero ");
        checkToken(context);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
      // ignore: empty_catches
    } catch (err) {}
  }

  checkToken(context) async {
    print("yaha aepuge");
    try {
      await dio.get('/teachers?sort=-createdAt');
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
      // ignore: empty_catches
    } catch (err) {}
  }
}
