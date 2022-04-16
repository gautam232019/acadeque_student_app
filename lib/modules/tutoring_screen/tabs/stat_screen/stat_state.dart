import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/home/models/teachers_response.dart';
import 'package:dio/dio.dart';

class StatState extends BaseState {
  TeachersResponse? teachersState;
  Dio dio = getHttp();

  StatState() {
    getTeachers();
  }
  getTeachers() async {
    setLoading(true);
    try {
      final response = await dio.get("/teachers?sort=-createdAt");
      teachersState = TeachersResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}

    setLoading(false);
  }
}
