import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/models/student_question_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AskState extends BaseState {
  Dio dio = getHttp();
  String? token;
  String id = "";

  AskState() {
    getToken();
    getQuestions();
    setLoading(true);
  }
  String? questin;
  String? ans;

  StudentQuestionResponse? studentQuestionsState;
  getToken() {
    setLoading(true);
    token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
    notifyListeners();
    Map<String, dynamic> user = Jwt.parseJwt(token!);
    id = user["userId"];
    notifyListeners();
    // print(userState?.userId!);
  }

  getQuestions() async {
    setLoading(true);
    try {
      print("yo token ho $id");
      final response = await dio.get("/students/$id/questions");
      studentQuestionsState = StudentQuestionResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {
      print(err);
    }
    setLoading(false);
  }
}
