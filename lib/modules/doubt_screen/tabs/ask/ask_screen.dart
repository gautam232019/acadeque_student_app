import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AskScreen extends StatelessWidget {
  const AskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("This is ask screen"),
      ),
    );
  }
}
