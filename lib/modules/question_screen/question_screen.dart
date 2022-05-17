// ignore_for_file: prefer_const_constructors,  prefer_const_literals_to_create_immutables

import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/question_widget.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/common/utils/colors_util.dart';
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
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: sPagePadding,
                    child: state.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.questionState!.data!.question!.first
                                      .mediaURL !=
                                  null)
                                Container(
                                  child: Image.network(state.questionState!
                                      .data!.question!.first.mediaURL!),
                                  height: 163,
                                  width: 329,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                )
                              else
                                Container(
                                  height: 163,
                                  width: 329,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: colorBox,
                                  ),
                                ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                state.questionState!.data!.question!.first
                                    .question!,
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
                                state.questionState!.data!.question!.first
                                    .answers!.first.answer!,
                                style: TextStyle(
                                    color: colorTextLight,
                                    height: 1.5,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto'),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Answered by:',
                                    style: TextStyle(
                                        color: colorCorrect,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto'),
                                  ),
                                  sWidthSpan,
                                  Text(state.questionState!.data!.question!
                                      .first.answers!.first.teacherId!.name!)
                                ],
                              ),
                              lHeightSpan,
                              if (state.questionState!.data!.question!.first
                                      .answers!.first.ratingId ==
                                  null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        state.onAddRating("poor");
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svg/unsatisfied_icon.svg',
                                        height: 32,
                                        width: 32,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        state.onAddRating("normal");
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svg/neutral_icon.svg',
                                        height: 32,
                                        width: 32,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        state.onAddRating("satisfied");
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svg/satisfied_icon.svg',
                                        height: 32,
                                        width: 32,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        state.onAddRating("very satisfied");
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svg/verysatisfied_icon.svg',
                                        height: 32,
                                        width: 32,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
