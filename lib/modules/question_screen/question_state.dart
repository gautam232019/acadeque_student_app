import 'dart:convert';

import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/models/student_question_response.dart';
import 'package:acadeque_student_app/modules/question_screen/models/single_question_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class QuestionState extends BaseState {
  Questions? item;
  QuestionState(context) {
    setLoading(true);
    item = ModalRoute.of(context)!.settings.arguments as Questions;
    notifyListeners();
    fetchQuestion();
  }

  Dio dio = getHttp();

  SingleQuestionResponse? questionState;

  fetchQuestion() async {
    try {
      final response = await dio.get("/questions/${item!.sId!}");
      questionState = SingleQuestionResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }

  onAddRating(satisfaction) async {
    setLoading(true);
    try {
      var data = {
        "rateTo": "answer",
        "rateToId": questionState!.data!.question!.first.answers!.first.sId,
        "satisfaction": satisfaction,
      };
      await dio.post("/ratings", data: data);
      ToastService().s("Rating added!");
      fetchQuestion();
      // ignore: empty_catches
    } catch (err) {}
  }
}
