import 'dart:io';

import 'package:acadeque_student_app/core/http/http.dart';
import 'package:acadeque_student_app/core/services/toast_service.dart';
import 'package:acadeque_student_app/core/state/base_state.dart';
import 'package:acadeque_student_app/modules/add_question/models/subject_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddQuestionState extends BaseState {
  Dio dio = getHttp();
  final ImagePicker picker = ImagePicker();

  File? imagefile;

  pickFromCamera(context) async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      File temp = File(file.path);
      final kera = temp.readAsBytesSync().lengthInBytes;
      final kb = kera / 1024;
      final mb = kb / 1024;
      int finalMb = mb.toInt();
      if (finalMb <= 10) {
        imagefile = File(file.path);
      } else {
        ToastService().w("Maximum image size is 10 MB!");
      }
    }
    notifyListeners();
  }

  String question = "";
  onQuestionChange(val) {
    question = val;
    notifyListeners();
  }

  bool createQuestionLoading = false;
  onQuestionLoading(val) {
    createQuestionLoading = val;
    notifyListeners();
  }

  onSubmit(context) async {
    onQuestionLoading(true);
    if (subject != null && question.isNotEmpty && imagefile != null) {
      try {
        var data = FormData.fromMap({
          "question": question,
          "subjectId": subject,
          "media": await MultipartFile.fromFile(imagefile!.path)
        });
        await dio.post("/questions", data: data);
        ToastService().s("Question uploaded successfully!");
        Navigator.pushNamed(context, "/confirmation");
      } catch (err) {
        // print(err);
      }
    } else {
      ToastService().w("Please fill all fields!");
    }
    // print(imagefile);
    onQuestionLoading(false);
  }

  pickFromGallery(context) async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      File temp = File(file.path);
      final kera = temp.readAsBytesSync().lengthInBytes;
      final kb = kera / 1024;
      final mb = kb / 1024;
      int finalMb = mb.toInt();
      if (finalMb <= 10) {
        imagefile = File(file.path);
      } else {
        ToastService().w("Maximum image size is 10 MB!");
      }
    }
    notifyListeners();
  }

  AddQuestionState() {
    fetchSubjects();
  }

  SubjectResponse? subjectState;

  String? subject;

  onSubjectChange(val) {
    subject = val;
    notifyListeners();
  }

  fetchSubjects() async {
    setLoading(true);
    try {
      final response = await dio.get("/subjects");
      subjectState = SubjectResponse.fromJson(response.data);
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
