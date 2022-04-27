import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/instructor_profile/models/all_feedback_response.dart';
import 'package:acadeque_student_app/modules/instructor_profile/models/student_feed_back_response.dart';
import 'package:acadeque_student_app/modules/instructor_profile/models/teacher_profile_response.dart';
import 'package:acadeque_student_app/modules/instructor_profile/models/teacher_review_response.dart';
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
    fetchReviews();
    fetchStudentFeedback();
    fetchAllFeedback();
  }

  TeacherReviewResponse? teacherReviewState;

  fetchReviews() async {
    try {
      final response = await dio.get("/teachers/$id/reviews");
      teacherReviewState = TeacherReviewResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
  }

  StudentFeedBackResponse? studentFeedBackState;

  fetchStudentFeedback() async {
    try {
      final response = await dio.get("/teachers/$id/overallsatisfaction");
      studentFeedBackState = StudentFeedBackResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
  }

  AllFeedbackResponse? allfeedbackState;
  List<Map<String, dynamic>>? listOMaps;

  fetchAllFeedback() async {
    try {
      final response = await dio.get("/teachers/$id/satisfactions");
      allfeedbackState = AllFeedbackResponse.fromJson(response.data);
      notifyListeners();
      listOMaps = allfeedbackState!.data!.satisfactions!
          .map((something) => {
                "field": something.satisfaction,
                "number": something.students,
              })
          .toList();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }

  TeacherProfileResponse? teacherProfileState;

  getTeacherProfile() async {
    print("yo id ho $id");
    if (id != null) {
      try {
        final response = await dio.get("/teachers/$id");
        teacherProfileState = TeacherProfileResponse.fromJson(response.data);
        notifyListeners();
        // ignore: empty_catches
      } catch (err) {
        print(err);
      }
    }
  }
}
