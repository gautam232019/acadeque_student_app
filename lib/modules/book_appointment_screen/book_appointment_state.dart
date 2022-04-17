import 'package:acadeque_student_app/core/state/base_state.dart';

class BookAppointmentState extends BaseState {
  String appointmentDuration = "15 Mins";

  onAppointmentDurationChange(val) {
    appointmentDuration = val;
    notifyListeners();
  }
}
