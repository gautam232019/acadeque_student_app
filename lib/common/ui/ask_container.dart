import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/ask_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AskContainer extends StatelessWidget {
  final bool isSolved;
  final String question;
  final String desc;

  const AskContainer({
    Key? key,
    required this.isSolved,
    required this.question,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AskState>(context);

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 22, right: 22, top: 15, bottom: 15),
          child: InkWell(
            onTap: () {
              if (state.studentQuestionsState != null) {
                Navigator.pushNamed(context, "/question_screen", arguments: {
                  "question": "What is your name?",
                  "ans": "chris ho vai"
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 103,
                  width: 114,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(''),
                      Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF59AEFD),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Text(
                                    isSolved == true ? 'Solved' : 'Pending'),
                              ))),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF33354E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        question,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        desc,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                            color: Color(0xFFA1A1A1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
