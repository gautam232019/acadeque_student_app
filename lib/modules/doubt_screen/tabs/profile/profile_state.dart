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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

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
                  LocalStorageService().clear(LocalStorageKeys.email);
                  LocalStorageService()
                      .clear(LocalStorageKeys.isNaviveProvider);
                  LocalStorageService().clear(LocalStorageKeys.userName);
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

  onPasswordUpdate(context) async {
    setLoading(true);
    if (oldPassword.isNotEmpty && newPassword.isNotEmpty) {
      if (formKey.currentState!.validate()) {
        try {
          final user = FirebaseAuth.instance.currentUser;
          final cred = EmailAuthProvider.credential(
              email: userDetailState!.data!.student!.email!,
              password: oldPassword);

          final result = await user!.reauthenticateWithCredential(cred);
          if (result.user != null) {
            await result.user!.updatePassword(newPassword);
            ToastService().s("Password changed successfully!");
            Navigator.of(context).pop(true);
          }
        } catch (err) {
          ToastService().e(err.toString());
          Navigator.of(context).pop(true);
        }
      } else {
        ToastService().w(
            "Password must contain uppercase, lowercase, number and character!");
      }
    } else {
      ToastService().w("Please provide password!");
    }
    setLoading(false);
  }

  String contactNumber = "";

  String codeSms = "";

  onContactChange(val) {
    contactNumber = val;
    notifyListeners();
  }

  onCodeSmsChange(val) {
    codeSms = val;
    notifyListeners();
  }

  bool showOtpField = false;

  bool contactUpdateLoading = false;

  setShowOtpField(val) {
    showOtpField = val;
    notifyListeners();
  }

  setContactLoading(val) {
    contactUpdateLoading = val;
    notifyListeners();
  }

  String? submitVerificationId;

  sendOtp() async {
    if (contactNumber.isNotEmpty) {
      try {
        contactUpdateLoading == true;
        notifyListeners();
        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+91 $contactNumber",
          verificationCompleted: (PhoneAuthCredential credential) async {
            final user =
                await FirebaseAuth.instance.signInWithCredential(credential);
            if (user.user != null) {
              ToastService().s("Successfull!");
            }
          },
          verificationFailed: (FirebaseAuthException exception) {
            ToastService().e(exception.message!);
          },
          codeSent: (String verificationId, int? resendToken) {
            setShowOtpField(true);
            submitVerificationId = verificationId;
            notifyListeners();
            ToastService().s("Otp sent!");
          },
          codeAutoRetrievalTimeout: (val) {},
        );
      } catch (err) {
        ToastService().e(err.toString());
      }
    } else {
      ToastService().w("Please provide contact!");
    }
  }

  onContactUpdateSubmit(context) async {
    if (submitVerificationId != null && codeSms.isNotEmpty) {
      try {
        final response = PhoneAuthProvider.credential(
            verificationId: submitVerificationId!, smsCode: codeSms);
        await FirebaseAuth.instance.signInWithCredential(response);
        final token = await FirebaseAuth.instance.currentUser!.getIdToken();
        this.token = token;
        notifyListeners();
        sendContactNumber(context);
        // ignore: empty_catches
      } catch (err) {}
    } else {
      ToastService().w("Please provide Otp!");
    }
  }

  sendContactNumber(context) async {
    try {
      await dio.patch("/auth/updatecontact?idToken=$token");
      ToastService().s("Contact Successfully added!");
      Navigator.pop(context);
      getUserDetail();
      // ignore: empty_catches
    } catch (err) {}
  }

  String newEmail = "";
  onNewEmailChange(val) {
    newEmail = val;
    notifyListeners();
  }

  onNewEmailUpdateSubmit(context) async {
    if (newEmail.isNotEmpty) {
      if (emailFormKey.currentState!.validate()) {
        try {
          final data = {
            "email": newEmail,
          };
          await dio.patch("/auth/updateemail", data: data);
          ToastService().s("Email id updated successfully!");
          Navigator.pop(context);
          getUserDetail();
          // ignore: empty_catches
        } catch (err) {}
      }
    } else {
      ToastService().w("Please provide email!");
    }
  }
}
