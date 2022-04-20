import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/tutoring_tutor_widget.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/stat_screen/stat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StatState>(context);

    final size = MediaQuery.of(context).size.height;
    return Container(
      color: primaryColor,
      child: ListView(
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/svg/arrow_back.svg'),
                      )),
                  const Text(
                    'Statistics',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: primaryColor,
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
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: state.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.teachersState?.data?.teachers?.isEmpty ?? true
                      ? const Center(
                          child: Text("No Teachers"),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: state.teachersState!.data!.teachers!
                                .map(
                                  (e) => Column(
                                    children: [
                                      TutoringTutorWidget(teacherItem: e),
                                      sHeightSpan,
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
            ),
          )
        ],
      ),
    );
  }
}
