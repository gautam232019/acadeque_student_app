import 'package:acadeque_student_app/core/state/base_state.dart';

class TutoringState extends BaseState {
  int bottomIndex = 0;
  onBottomItemTapped(int index, context) {
    bottomIndex = index;
    notifyListeners();
  }
}
