import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/instructor_profile/models/teacher_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class InstructorProfileState extends BaseState {
  Dio dio = getHttp();

  String? id;
  InstructorProfileState(context) {
    setLoading(true);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    id = args['id'];
    notifyListeners();
    getTeacherProfile();
  }

  TeacherProfileResponse? teacherProfileState;

  getTeacherProfile() async {
    if (id != null) {
      try {
        final response = await dio.get("/teachers/$id");
        teacherProfileState = TeacherProfileResponse.fromJson(response.data);
        notifyListeners();
        // ignore: empty_catches
      } catch (err) {}
    }
    setLoading(false);
  }
}
