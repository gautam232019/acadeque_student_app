import 'package:acadeque_student_app/common/ui/tutor_profile.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/tutor_home_screen/tutor_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class TutorHomeScreen extends StatelessWidget {
  const TutorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TutorHomeState>(context);

    return SafeArea(
      child: Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 45),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.userDetailState!.data!.student!.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Roboto'),
                              ),
                              sHeightSpan,
                              Text(
                                Jiffy(DateTime.now())
                                    .format("EEEE, do MMM yyyy")
                                    .toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => NotificationScreen()));
                            },
                            child: SizedBox(
                              height: 24.92,
                              width: 22,
                              child: SvgPicture.asset(
                                  'assets/svg/notification_icon.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 67,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 52,
                        width: 327,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFFA1A1A1),
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFA1A1A1),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'),
                              hintText:
                                  'Filter for specific subject(e.g. Statistics)'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Top Tutors',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    state.teacherLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.teachersState?.data?.teachers?.isEmpty ?? true
                            ? const Center(
                                child: Text("No Teachers"),
                              )
                            : Column(
                                children: state.teachersState!.data!.teachers!
                                    .map((e) => Column(
                                          children: [
                                            TutorProfile(
                                              teacherItem: e,
                                            ),
                                            const Divider(
                                              color: Color(0xFFE5E5E5),
                                              height: 30,
                                              thickness: 1,
                                              indent: 5,
                                              endIndent: 5,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                  ],
                ),
              ),
      ),
    );
  }
}
