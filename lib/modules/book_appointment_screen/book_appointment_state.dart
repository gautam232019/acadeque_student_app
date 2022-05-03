import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/book_appointment_screen/models/booking_appointment_response.dart';
import 'package:acadeque_student_app/modules/book_appointment_screen/models/teacher_schedule_response.dart';
import 'package:acadeque_student_app/modules/book_appointment_screen/models/teacher_slot_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BookAppointmentState extends BaseState {
  String appointmentDuration = "15 Mins";

  List appointmentDurationList = [
    "15",
    "30",
    "60",
  ];
  Dio dio = getHttp();

  String? id;
  String? name;

  TeacherSlotResponse? teacherSlotState;

  DateTime? selectedAppointmentDate;

  Slots? selectedTimeSlot;

  onTimeSlotSelect(val) {
    selectedTimeSlot = val;
    notifyListeners();
  }

  onAppointmentDateChange(val) {
    selectedAppointmentDate = val;
    getTeacherSlots();
    notifyListeners();
  }

  BookAppointmentState(context) {
    setLoading(true);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    id = args['id'];
    name = args['name'];
    notifyListeners();
    getTeacherSchedule();
  }

  TeacherScheduleResponse? teacherScheduleState;

  getTeacherSchedule() async {
    setLoading(true);
    try {
      final response =
          await dio.get("/teachers/$id/schedules?year=${DateTime.now().year}");
      teacherScheduleState = TeacherScheduleResponse.fromJson(response.data);
      notifyListeners();
      selectedAppointmentDate = DateTime(
        teacherScheduleState!.data!.schedules!.first.year!,
        teacherScheduleState!.data!.schedules!.first.month!,
        teacherScheduleState!.data!.schedules!.first.days![0],
      );
      // print(teacherScheduleState!.data!.schedules!.last.month);
      notifyListeners();
      getTeacherSlots();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }

  bool slotLoading = false;
  setSlotLoading(val) {
    slotLoading = val;
    notifyListeners();
  }

  getTeacherSlots() async {
    setSlotLoading(true);
    try {
      // print(
      // "/teachers/$id/schedules/slots?year=${selectedAppointmentDate?.year}&month=${selectedAppointmentDate?.month}&day=${selectedAppointmentDate?.day}&duration=${appointmentDuration == "15 Mins" ? "15" : appointmentDuration == "30 Mins" ? "30" : "60"}");
      final response = await dio.get(
          "/teachers/$id/schedules/slots?year=${selectedAppointmentDate!.year}&month=${selectedAppointmentDate!.month}&day=${selectedAppointmentDate!.day}&duration=${appointmentDuration == "15 Mins" ? "15" : appointmentDuration == "30 Mins" ? "30" : "60"}");
      // print(response.data);
      teacherSlotState = TeacherSlotResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setSlotLoading(false);
  }

  onAppointmentDurationChange(val) {
    appointmentDuration = val;
    notifyListeners();
    getTeacherSlots();
  }

  bool submitLoading = false;
  setSubmitLoading(val) {
    submitLoading = val;
    notifyListeners();
  }

  BookingAppointmentResponse? bookingAppointmentState;

  onSubmit() async {
    setSubmitLoading(true);
    if (selectedTimeSlot != null) {
      try {
        var data = {
          "teacherId": id,
          "from": selectedTimeSlot!.from,
          "to": selectedTimeSlot!.to,
          "duration": appointmentDuration == "15 Mins"
              ? "15"
              : appointmentDuration == "30 Mins"
                  ? "30"
                  : "60",
        };
        final response = await dio.post("/appointments", data: data);
        bookingAppointmentState =
            BookingAppointmentResponse.fromJson(response.data);
        notifyListeners();
        // ignore: empty_catches
      } catch (err) {}
    } else {
      ToastService().w("Please select time slot!");
    }
    setSubmitLoading(false);
  }
}
