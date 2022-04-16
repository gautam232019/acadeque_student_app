// ignore_for_file: prefer_const_constructors,  prefer_const_literals_to_create_immutables

import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/question_widget.dart';
import 'package:acadeque_student_app/modules/question_screen/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final state = Provider.of<QuestionState>(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child:
                                SvgPicture.asset('assets/svg/arrow_back.svg')),
                        const Text(
                          'Your Questions 1',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                        ),
                        Text('')
                      ],
                    ),
                  ),
                  height: size * 0.2,
                  decoration: BoxDecoration(
                      color: Color(0xFF59AEFD),
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg_shape.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero)),
                    height: size * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: state.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : QuestionWidget(
                              question: state.item!.question!,
                              answer: state.item!.solved == true
                                  ? "Answers"
                                  : "Not solved",
                            ),
                    ))
              ],
            ),
    );
  }
}
