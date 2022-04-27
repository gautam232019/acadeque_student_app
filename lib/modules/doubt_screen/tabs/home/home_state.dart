import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/doube_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/models/user_detail_response.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/home/models/teachers_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class HomeState extends BaseState {
  Dio dio = getHttp();

  HomeState() {
    getToken();
    getUserDetail();
    getTeachers();
  }
  String? token;
  String id = "";

  Map<String, dynamic>? user;

  userDetailResponse? userDetailState;

  UserResponse? userState;

  bool teacherLoading = false;

  setTeacherLoading(val) {
    teacherLoading = val;
    notifyListeners();
  }

  TeachersResponse? teachersState;

  getTeachers() async {
    setTeacherLoading(true);
    try {
      final response = await dio.get("/teachers");
      teachersState = TeachersResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {
      print(err);
    }

    setTeacherLoading(false);
  }

  getToken() {
    setLoading(true);
    token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
    notifyListeners();
    Map<String, dynamic> user = Jwt.parseJwt(token!);
    id = user["userId"] as String;
    notifyListeners();
    // print(userState?.userId!);
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
}
