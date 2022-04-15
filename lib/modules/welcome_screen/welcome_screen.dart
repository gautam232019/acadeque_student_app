import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ElevatedButton(
          child: Text('kera'),
          onPressed: () {
            LocalStorageService().clear(LocalStorageKeys.accessToken);
          },
        ),
      ),
    );
  }
}
