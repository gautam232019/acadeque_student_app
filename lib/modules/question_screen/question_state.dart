import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/models/student_question_response.dart';
import 'package:flutter/material.dart';

class QuestionState extends BaseState {
  Questions? item;
  QuestionState(context) {
    setLoading(true);
    item = ModalRoute.of(context)!.settings.arguments as Questions;
    notifyListeners();
    setLoading(false);
  }
}
