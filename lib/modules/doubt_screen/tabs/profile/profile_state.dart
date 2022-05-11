import 'dart:io';

import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/doube_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/models/user_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfileState extends BaseState {
  Dio dio = getHttp();

  final ImagePicker picker = ImagePicker();

  File? imagefile;

  pickFromCamera(context) async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      File temp = File(file.path);
      final kera = temp.readAsBytesSync().lengthInBytes;
      final kb = kera / 1024;
      final mb = kb / 1024;
      int finalMb = mb.toInt();
      if (finalMb <= 10) {
        imagefile = File(file.path);
      } else {
        ToastService().w("Maximum image size is 10 MB!");
        return;
      }
    }
    notifyListeners();
    updateProfile();
  }

  pickFromGallery(context) async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      File temp = File(file.path);
      final kera = temp.readAsBytesSync().lengthInBytes;
      final kb = kera / 1024;
      final mb = kb / 1024;
      int finalMb = mb.toInt();
      if (finalMb <= 10) {
        imagefile = File(file.path);
      } else {
        ToastService().w("Maximum image size is 10 MB!");
        return;
      }
    }
    notifyListeners();
    updateProfile();
  }

  updateProfile() async {
    setLoading(true);
    try {
      var data = FormData.fromMap(
          {"student_image": await MultipartFile.fromFile(imagefile!.path)});
      await dio.patch("/students/uploadprofile", data: data);
      ToastService().s("Profile uploaded");
      getUserDetail();
      // ignore: empty_catches
    } catch (err) {}
  }

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
    if (id.isNotEmpty) {
      try {
        final response = await dio.get("/students/$id");
        userDetailState = userDetailResponse.fromJson(response.data);
        notifyListeners();
        // ignore: empty_catches
      } catch (err) {}
    }
    setLoading(false);
  }

  String oldPassword = "";
  String newPassword = "";

  onNewPasswordChange(val) {
    newPassword = val;
    notifyListeners();
  }

  onOldPasswordChange(val) {
    oldPassword = val;
    notifyListeners();
  }

  onPasswordUpdate() async {
    setLoading(true);
    if (oldPassword.isNotEmpty && newPassword.isNotEmpty) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        final cred = EmailAuthProvider.credential(
            email: userDetailState!.data!.student!.email!,
            password: oldPassword);

        final result = await user!.reauthenticateWithCredential(cred);
        if (result.user != null) {
          await result.user!.updatePassword(newPassword);
          ToastService().s("Password changed successfully!");
        }
      } catch (err) {
        ToastService().e(err.toString());
      }
    } else {
      ToastService().w("Please provide password!");
    }
    setLoading(false);
  }
}
