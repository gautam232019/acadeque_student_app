import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/doube_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/models/user_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfileState extends BaseState {
  Dio dio = getHttp();

  ProfileState() {
    getToken();
    getUserDetail();
  }

  String? token;
  String id = "";

  Map<String, dynamic>? user;

  userDetailResponse? userDetailState;

  UserResponse? userState;

  getToken() {
    setLoading(true);
    token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
    notifyListeners();
    Map<String, dynamic> user = Jwt.parseJwt(token!);
    id = user["userId"] as String;
    notifyListeners();
    // print(userState?.userId!);
  }

  Map<String, dynamic> form = {};

  onChange(String key, dynamic value) {
    form[key] = value;
    notifyListeners();
  }

  onEditSubmit() async {
    setLoading(true);
    try {
      final token = LocalStorageService().read(LocalStorageKeys.accessToken);
      // print("yo token ho $token");
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      final userId = payload["userId"];
      final response = await dio.patch("/students/$userId", data: form);
      if (response.data["status"] == "success") {
        ToastService().s("Updated successfully!");
      }
      getToken();
      getUserDetail();
      // ignore: empty_catches
    } catch (err) {}
  }

  onLogout(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure you want to logout?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  LocalStorageService().clear(LocalStorageKeys.accessToken);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
            ],
          );
        });
  }

  getUserDetail() async {
    print("yo id ho$id");
    if (id.isNotEmpty) {
      try {
        final response = await dio.get("/students/$id");
        print("hello");
        userDetailState = userDetailResponse.fromJson(response.data);
        print(response.data);
        notifyListeners();
        // ignore: empty_catches
      } catch (err) {
        print(err);
      }
    }
    setLoading(false);
  }
}
