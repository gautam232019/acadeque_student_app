import 'package:acadeque_student_app/common/utils/debouncer.dart';
import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/home/models/teachers_response.dart';
import 'package:dio/dio.dart';

class StatState extends BaseState {
  TeachersResponse? teachersState;
  Dio dio = getHttp();

  String searchValue = "";

  late Debouncer<String> searchDebouncer =
      Debouncer(const Duration(seconds: 1), (value) {
    searchValue = value;
    notifyListeners();
    searchTeacher();
  }, '');

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

  TeachersResponse? searchState;

  searchTeacher() async {
    setLoading(true);
    if (searchValue.isNotEmpty) {
      try {
        final response = await dio.get("/teachers/search?value=$searchValue");
        searchState = TeachersResponse.fromJson(response.data);
        teachersState!.data!.teachers = searchState!.data!.teachers!;
        notifyListeners();
        // ignore: empty_catches
      } catch (err) {}
    } else {
      getTeachers();
    }
    setLoading(false);
  }
}
