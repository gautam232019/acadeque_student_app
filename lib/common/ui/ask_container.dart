import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/ask_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/models/student_question_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AskContainer extends StatelessWidget {
  Questions? item;
  AskContainer({Key? key, required this.item}) : super(key: key);

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
                Navigator.pushNamed(context, "/question_screen",
                    arguments: item);
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
                                item!.solved == true ? 'Solved' : 'Pending'),
                          ),
                        ),
                      ),
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
                        item!.question!,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Normal Descriptions",
                        style: TextStyle(
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
