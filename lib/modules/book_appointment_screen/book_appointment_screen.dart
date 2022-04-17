import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/modules/book_appointment_screen/book_appointment_state.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final state = Provider.of<BookAppointmentState>(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset('assets/svg/back.svg')),
                      const Text(
                        'Book  Appointment',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: Colors.white),
                      ),
                      Image.asset('assets/images/message.png'),
                    ],
                  ),
                ),
                height: height * .2,
                decoration: const BoxDecoration(
                  color: Color(0xFF59AEFD),
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg_shape.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero)),
                height: height * 0.8,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 375,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/verifiedicon.png'),
                                    ],
                                  ),
                                ),
                                height: 160,
                              ),
                              const Text(
                                'Dr. Joff Yu',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Qualification',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Duration',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 24, 40, 53),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                state.onAppointmentDurationChange("15 Mins");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        state.appointmentDuration == "15 Mins"
                                            ? primaryColor
                                            : Colors.white),
                                height: 38,
                                width: 91,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '15 Mins',
                                    style: TextStyle(
                                        color: state.appointmentDuration ==
                                                "15 Mins"
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                state.onAppointmentDurationChange("30 Mins");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        state.appointmentDuration == "30 Mins"
                                            ? primaryColor
                                            : Colors.white),
                                height: 38,
                                width: 91,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '30 Mins',
                                    style: TextStyle(
                                        color: state.appointmentDuration ==
                                                "30 Mins"
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                state.onAppointmentDurationChange("1 Hour");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: state.appointmentDuration == "1 Hour"
                                        ? primaryColor
                                        : Colors.white),
                                height: 36,
                                width: 91,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '1 Hour',
                                    style: TextStyle(
                                        color: state.appointmentDuration ==
                                                "1 Hour"
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Select Dates',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 24, 40, 53),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CalendarTimeline(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 30)),
                            onDateSelected: (date) => print(date),
                            leftMargin: 10,
                            monthColor: Colors.black,
                            dayColor: Colors.black,
                            activeDayColor: Colors.white,
                            activeBackgroundDayColor: primaryColor,
                            dotsColor: Colors.black,
                            locale: 'en_ISO',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Times',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 24, 40, 53),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 206, 206)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '08:00AM - 09:30AM',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 157, 157),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 206, 206)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '10:00AM - 11:00AM',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 157, 157),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 206, 206)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '2:30PM - 3:30PM',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 157, 157),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 206, 206)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: primaryColor),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '4:30PM - 5:30PM',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 206, 206)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '6:00PM - 7:30PM',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 157, 157),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 206, 206)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '8:00PM - 9:30PM',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 157, 157),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             AppointmentConfirmationScreen()));
                            },
                            child: Container(
                              child: const Center(
                                child: Text(
                                  'Next',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                              width: 327,
                              height: 48,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        lHeightSpan,
                        lHeightSpan,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          // Positioned(
          //   top: 140,
          //   left: size / 2 - 54,
          //   child: SizedBox(
          //     width: 120,
          //     height: 120,
          //     child: Transform.scale(
          //       scale: 1,
          //       child: Padding(
          //         padding: const EdgeInsets.only(bottom: 30),
          //         child: Container(
          //           decoration: const BoxDecoration(
          //               shape: BoxShape.circle, color: Color(0xFF373737)),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //     top: 220,
          //     left: size / 2 - 8,
          //     child: SvgPicture.asset('assets/svg/verified.svg')),
        ],
      ),
    );
  }
}
