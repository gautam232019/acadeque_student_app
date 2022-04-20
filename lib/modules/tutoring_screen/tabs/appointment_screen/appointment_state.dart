import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/models/student_question_response.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/appointment_screen/models/appointment_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AppointmentState extends BaseState {
  Dio dio = getHttp();
  String? token;
  String id = "";

  AppointmentState() {
    getToken();
    getAppointments();
    setLoading(true);
  }

  String? questin;
  String? ans;

  AppointmentResponse? appointmentState;
  getToken() {
    setLoading(true);
    token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
    notifyListeners();
    Map<String, dynamic> user = Jwt.parseJwt(token!);
    id = user["userId"] as String;
    notifyListeners();
    // print(userState?.userId!);
  }

  getAppointments() async {
    setLoading(true);

    try {
      // print("yo token ho $id");
      final response = await dio.get("/appointments");
      appointmentState = AppointmentResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
