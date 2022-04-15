// ignore_for_file: prefer_const_constructors,  prefer_const_literals_to_create_immutables

import 'package:acadeque_student_app/common/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final String answer;

  const QuestionWidget({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(question);
    print(answer);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          Container(
            height: 163,
            width: 329,
            decoration: BoxDecoration(
              color: colorBox,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            question,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Answer',
            style: TextStyle(
                color: colorCorrect,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            answer,
            style: TextStyle(
                color: colorTextLight,
                height: 1.5,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/unsatisfied_icon.svg',
                  height: 32,
                  width: 32,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/neutral_icon.svg',
                height: 52,
                width: 52,
              ),
              SvgPicture.asset(
                'assets/svg/satisfied_icon.svg',
                height: 32,
                width: 32,
              ),
              SvgPicture.asset(
                'assets/svg/verysatisfied_icon.svg',
                height: 32,
                width: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
