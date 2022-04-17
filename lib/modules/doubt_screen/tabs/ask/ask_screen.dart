import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/ask_container.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/ask/ask_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AskScreen extends StatelessWidget {
  const AskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final state = Provider.of<AskState>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Your Questions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            height: size * 0.2,
            decoration: const BoxDecoration(
                color: Color(0xFF59AEFD),
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_shape.png'),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero)),
              height: size * 0.8 - 68,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: state.loading
                      ? const Center(child: CircularProgressIndicator())
                      : state.studentQuestionsState?.data?.questions?.isEmpty ??
                              true
                          ? const Center(
                              child: Text("No Questions"),
                            )
                          : ListView.builder(
                              itemCount: state.studentQuestionsState!.data!
                                  .questions!.length,
                              itemBuilder: (context, index) {
                                final item = state.studentQuestionsState!.data!
                                    .questions![index];
                                return AskContainer(
                                  item: item,
                                );
                              },
                            ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(context, "/add_question");
            if (result != null) {
              state.getQuestions();
            }
          },
          // backgroundColor: colorBox,
          child: const Icon(Icons.add)),
    );
  }
}
