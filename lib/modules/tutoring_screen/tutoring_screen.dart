import 'package:acadeque_student_app/modules/doubt_screen/tabs/profile/profile_screen.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/profile/profile_state.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/appointment_screen/appointment_screen.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/appointment_screen/appointment_state.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/stat_screen/stat_screen.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/stat_screen/stat_state.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/tutor_home_screen/tutor_home_screen.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/tutor_home_screen/tutor_home_state.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tutoring_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TutoringScreen extends StatelessWidget {
  const TutoringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TutoringState>(context);

    int selectedIndex = 0;
    var tabs = [
      ChangeNotifierProvider(
        create: (_) => TutorHomeState(),
        child: const TutorHomeScreen(),
      ),
      // ChangeNotifierProvider(
      //   create: (_) => StatState(),
      //   child: const StatScreen(),
      // ),
      ChangeNotifierProvider(
        create: (_) => AppointmentState(),
        child: const AppointmentScreen(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProfileState(),
        child: const ProfileScreen(),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: state.loading
            ? const Center(child: CircularProgressIndicator())
            : tabs.elementAt(state.bottomIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              border: Border.all(color: const Color(0XFFEBEBEB))),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/svg/home.svg',
                      color: state.bottomIndex == 0
                          ? const Color(0xFF59AEFD)
                          : const Color(0xFFA6A6A6),
                    ),
                  ),
                  label: "home",
                ),
                // BottomNavigationBarItem(
                //   icon: Padding(
                //     padding: const EdgeInsets.all(20),
                //     child: SvgPicture.asset(
                //       'assets/svg/search_icon.svg',
                //       color: state.bottomIndex == 1
                //           ? const Color(0xFF59AEFD)
                //           : const Color(0xFFA6A6A6),
                //     ),
                //   ),
                //   label: "ask",
                // ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/svg/appointment_icon.svg',
                      color: state.bottomIndex == 1
                          ? const Color(0xFF59AEFD)
                          : const Color(0xFFA6A6A6),
                    ),
                  ),
                  label: "ask",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/svg/person.svg',
                      color: state.bottomIndex == 2
                          ? const Color(0xFF59AEFD)
                          : const Color(0xFFA6A6A6),
                    ),
                  ),
                  label: "profile",
                ),
              ],
              currentIndex: selectedIndex,
              onTap: (index) {
                state.onBottomItemTapped(index, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
