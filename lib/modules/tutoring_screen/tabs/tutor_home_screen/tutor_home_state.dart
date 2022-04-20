import 'package:acadeque_student_app/common/utils/debouncer.dart';
import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/doube_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/models/user_detail_response.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/home/models/teachers_response.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/tutor_home_screen/models/search_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class TutorHomeState extends BaseState {
  Dio dio = getHttp();

  String searchValue = "";

  late Debouncer<String> searchDebouncer =
      Debouncer(const Duration(seconds: 1), (value) {
    searchValue = value;
    notifyListeners();
    print(searchValue);
    fetchSubject();

    // print('kera khau');
  }, '');

  searchResponse? searchState;

  fetchSubject() async {
    setTeacherLoading(true);
    if (searchValue.isNotEmpty) {
      try {
        final response = await dio.get("/subjects?name[regex]=$searchValue");
        searchState = searchResponse.fromJson(response.data);
        notifyListeners();
        if (searchState!.data!.subjects!.isNotEmpty) {
          fetchTeacherWithSubject(searchState!.data!.subjects![0].sId!);
        } else {
          ToastService().e("Subject not found!");
          getTeachers();
        }
        // ignore: empty_catches
      } catch (err) {}
    } else {
      getTeachers();
    }
  }

  TeachersResponse? searchedTeacherState;

  fetchTeacherWithSubject(String subjectId) async {
    setTeacherLoading(true);
    try {
      final response = await dio.get("/teachers?subjects[in]=$subjectId");
      searchedTeacherState = TeachersResponse.fromJson(response.data);
      notifyListeners();
      teachersState!.data!.teachers = searchedTeacherState!.data!.teachers!;
      print(teachersState!.data!.teachers!.length.toString());
      // ignore: empty_catches
    } catch (err) {}
    setTeacherLoading(false);
  }

  TutorHomeState() {
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
      final response = await dio.get("/teachers?sort=-createdAt");
      teachersState = TeachersResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}

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
