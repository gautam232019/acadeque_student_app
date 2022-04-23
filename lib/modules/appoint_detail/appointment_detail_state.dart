import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/appoint_detail/models/appointment_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AppointmentDetailState extends BaseState {
  Dio dio = getHttp();

  String? appointmentId;
  AppointmentDetailState(context) {
    setLoading(true);
    final args = ModalRoute.of(context)!.settings.arguments as String;
    appointmentId = args;
    notifyListeners();
    fetchAppointmentDetail();
  }

  AppointmentDetailResponse? appointmentDetails;

  fetchAppointmentDetail() async {
    setLoading(true);
    try {
      final response = await dio.get("/appointments/$appointmentId");
      appointmentDetails = AppointmentDetailResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
