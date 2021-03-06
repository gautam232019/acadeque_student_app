import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/divider_line.dart';
import 'package:acadeque_student_app/common/ui/rating_row_widget.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/common/utils/colors_util.dart';
import 'package:acadeque_student_app/modules/instructor_profile/instructor_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<InstructorProfileState>(context);
    makeFirstCapital(name) {
      final arr = name.split("");
      arr[0] = arr[0].toUpperCase();
      final pathauneString = arr.join("");
      return pathauneString;
    }

    makeFirstCapital("chris");

    return Scaffold(
      backgroundColor: primaryColor,
      body: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            mWidthSpan,
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: SvgPicture.asset('assets/svg/back.svg'),
                            ),
                            lWidthSpan,
                            lWidthSpan,
                            lWidthSpan,
                            if (state.loading == false &&
                                state.teacherProfileState != null &&
                                state.teacherProfileState!.data!.teacher!
                                    .profileURL!.isNotEmpty)
                              Container(
                                height: 120,
                                width: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.network(
                                    state.teacherProfileState!.data!.teacher!
                                        .profileURL!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.transparent,
                                ),
                              )
                            else
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                      height: 160,
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
                      height: 700,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 375,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (state.teacherProfileState != null)
                                    Text(
                                      state.teacherProfileState!.data!.teacher!
                                          .name!,
                                      style: const TextStyle(
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
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/book_appointment",
                                      arguments: {
                                        "id": state.teacherProfileState!.data!
                                            .teacher!.sId!,
                                        "name": state.teacherProfileState!.data!
                                            .teacher!.name!,
                                      });
                                },
                                child: Container(
                                  child: const Center(
                                    child: Text(
                                      'BOOK AN APPOINTMENT',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ),
                                  width: 327,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Center(
                                child: Container(
                                  child: const Center(
                                    child: Text(
                                      'CONNECT',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ),
                                  width: 327,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBB344),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF4E9C8),
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 60,
                                  width: 103,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.teacherProfileState?.data!.teacher
                                                ?.avgRating
                                                .toString() ??
                                            "0",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        'Rating',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF9D2D1),
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 60,
                                  width: 103,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.teacherProfileState?.data?.teacher
                                                ?.experience?.numberDecimal ??
                                            "0",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        'Experience',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFDEE2FF),
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 60,
                                  width: 103,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.teacherProfileState?.data?.teacher
                                                ?.students
                                                .toString() ??
                                            "0",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        ' Students',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'About me',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Rubik',
                                  color: Colors.black),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    state.teacherProfileState?.data?.teacher!
                                            .description ??
                                        "No descripttion",
                                    overflow: state.showMore == true
                                        ? TextOverflow.visible
                                        : TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 80, 79, 79),
                                        letterSpacing: 0.25),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                if (state.showMore == false)
                                  InkWell(
                                    onTap: () {
                                      state.setShowMore(true);
                                    },
                                    child: const Text(
                                      'Show More',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: Color(0xFF1F5567),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ],
                            ),
                            DividerLine(),
                            const Text(
                              'Student Feedback',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Rubik',
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 65,
                              width: 328,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF33354E),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 10),
                                child: Row(
                                  children: [
                                    // Image.asset('assets/images/64.png'),
                                    if (state.studentFeedBackState != null &&
                                        state.studentFeedBackState!.data!
                                            .satisfactions!.isNotEmpty)
                                      CircleAvatar(
                                        child: Text(
                                            "${state.studentFeedBackState!.data!.satisfactions![0].percentage!.toString()} %"),
                                      )
                                    else
                                      const CircleAvatar(
                                        child: Text("0%"),
                                      ),

                                    const SizedBox(
                                      width: 14,
                                    ),
                                    const Text(
                                      'Students Satisfied',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Container(
                                    width: 302 * .4,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFFBB344),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Container(
                                    width: 302 * .3,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF5C97CC),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Container(
                                    width: 302 * .1,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF9E61C9),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Container(
                                    width: 302 * .1,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFCC6F5C),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            if (state.listOMaps!.isNotEmpty)
                              Column(
                                children: state.listOMaps!.map((e) {
                                  String name = "";
                                  if (e["field"] == "normal") {
                                    name = "Neutral";
                                  } else if (e["field"] == "poor") {
                                    name = "Poor";
                                  } else if (e["field"] == "satisfied") {
                                    name = "Satisfied";
                                  } else if (e["field"] == "very satisfied") {
                                    name = "Very Satisfied";
                                  }
                                  return Column(
                                    children: [
                                      RatingRowWidget(
                                          title: name, count: e["number"]),
                                      DividerLine(),
                                    ],
                                  );
                                }).toList(),
                              )
                            else
                              Column(
                                children: [
                                  const RatingRowWidget(
                                      title: 'Very Satisfied', count: 0),
                                  DividerLine(),
                                  const RatingRowWidget(
                                      title: 'Satisfied ', count: 0),
                                  DividerLine(),
                                  const RatingRowWidget(
                                      title: 'Neutral', count: 0),
                                  DividerLine(),
                                  const RatingRowWidget(
                                      title: 'Poor', count: 0),
                                  DividerLine(),
                                ],
                              ),

                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Student Reviews',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Rubik',
                                      color: Colors.black),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: const Center(
                                      child: Text(
                                        'See All',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            fontFamily: 'Roboto'),
                                      ),
                                    ),
                                    width: 72,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 167,
                              width: 375,
                              child: state.teacherReviewState?.data?.reviews
                                          ?.isEmpty ??
                                      true
                                  ? const Center(
                                      child: Text('No Reviews found!'))
                                  : ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            width: 20,
                                          ),
                                      itemCount: state.teacherReviewState!.data!
                                          .reviews!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: ((context, index) {
                                        final item = state.teacherReviewState!
                                            .data!.reviews![index];
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: colorBox),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 34,
                                                  width: 34,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.studentId!.name!,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Roboto',
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                        width: 150,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                item.feedback!,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        Jiffy(item.createdAt!)
                                                            .fromNow(),
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontFamily:
                                                                'Roboto',
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          height: 151,
                                          width: 230,
                                        );
                                      })),
                            ),
                            // SizedBox(
                            //   height: 167,
                            //   width: 375,
                            //   child: ListView(
                            //     scrollDirection: Axis.horizontal,
                            //     children: [
                            //       Container(
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(8),
                            //             color: colorBox),
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(12.0),
                            //           child: Row(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Container(
                            //                 height: 34,
                            //                 width: 34,
                            //                 decoration: BoxDecoration(
                            //                     borderRadius:
                            //                         BorderRadius.circular(50),
                            //                     color: Colors.white),
                            //               ),
                            //               Padding(
                            //                 padding: const EdgeInsets.all(8.0),
                            //                 child: Column(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment
                            //                           .spaceBetween,
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.start,
                            //                   children: [
                            //                     const Text(
                            //                       'John Wick',
                            //                       style: TextStyle(
                            //                           fontSize: 14,
                            //                           fontWeight:
                            //                               FontWeight.bold,
                            //                           fontFamily: 'Roboto',
                            //                           color: Colors.white),
                            //                     ),
                            //                     SizedBox(
                            //                       width: 150,
                            //                       child: Row(
                            //                         mainAxisAlignment:
                            //                             MainAxisAlignment
                            //                                 .spaceBetween,
                            //                         children: const [
                            //                           Expanded(
                            //                             child: Text(
                            //                               'This is so amazing! I really enjoyed the session. I had all my doubts cleared.',
                            //                               style: TextStyle(
                            //                                   fontSize: 12,
                            //                                   fontWeight:
                            //                                       FontWeight
                            //                                           .normal,
                            //                                   fontFamily:
                            //                                       'Roboto',
                            //                                   color:
                            //                                       Colors.white),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                     const Text(
                            //                       '2 days ago',
                            //                       style: TextStyle(
                            //                           fontSize: 10,
                            //                           fontWeight:
                            //                               FontWeight.normal,
                            //                           fontFamily: 'Roboto',
                            //                           color: Colors.white),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //         height: 151,
                            //         width: 230,
                            //       ),
                            //       const SizedBox(
                            //         width: 10,
                            //       ),
                            //       Container(
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(8),
                            //             color: colorBox),
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(12.0),
                            //           child: Row(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Container(
                            //                 height: 34,
                            //                 width: 34,
                            //                 decoration: BoxDecoration(
                            //                   borderRadius:
                            //                       BorderRadius.circular(50),
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //               Padding(
                            //                 padding: const EdgeInsets.all(8.0),
                            //                 child: Column(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment
                            //                           .spaceBetween,
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.start,
                            //                   children: [
                            //                     const Text(
                            //                       'Sania Ray',
                            //                       style: TextStyle(
                            //                           fontSize: 14,
                            //                           fontWeight:
                            //                               FontWeight.bold,
                            //                           fontFamily: 'Roboto',
                            //                           color: Colors.white),
                            //                     ),
                            //                     SizedBox(
                            //                       width: 150,
                            //                       child: Row(
                            //                         mainAxisAlignment:
                            //                             MainAxisAlignment
                            //                                 .spaceBetween,
                            //                         children: const [
                            //                           Expanded(
                            //                             child: Text(
                            //                               'This is so amazing! I really enjoyed the session. I had all my doubts cleared.',
                            //                               style: TextStyle(
                            //                                   fontSize: 12,
                            //                                   fontWeight:
                            //                                       FontWeight
                            //                                           .normal,
                            //                                   fontFamily:
                            //                                       'Roboto',
                            //                                   color:
                            //                                       Colors.white),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                     const Text(
                            //                       '4 days ago',
                            //                       style: TextStyle(
                            //                           fontSize: 10,
                            //                           fontWeight:
                            //                               FontWeight.normal,
                            //                           fontFamily: 'Roboto',
                            //                           color: Colors.white),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //         height: 151,
                            //         width: 230,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            DividerLine(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Social Link',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Rubik',
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                if (state.teacherProfileState!.data!.teacher!
                                            .connects !=
                                        null &&
                                    state.teacherProfileState!.data!.teacher!
                                        .connects!.isNotEmpty) {
                                  Uri url = Uri.parse(state.teacherProfileState!
                                      .data!.teacher!.connects!.first.url!);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title:
                                          const Text("Twitter not available"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 57,
                                width: 326,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE9F6FF),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/twitter.svg'),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            'Twitter',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 53, 51, 51),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset('assets/svg/arrow.svg'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Container(
                            //   height: 57,
                            //   width: 326,
                            //   decoration: BoxDecoration(
                            //       color: const Color(0xFFE9F6FF),
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 8.0),
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Row(
                            //           children: [
                            //             Container(
                            //                 height: 33,
                            //                 width: 33,
                            //                 decoration: BoxDecoration(
                            //                     color: const Color(0xFF42c6a5),
                            //                     borderRadius:
                            //                         BorderRadius.circular(8)),
                            //                 child: Padding(
                            //                   padding:
                            //                       const EdgeInsets.all(8.0),
                            //                   child: SvgPicture.asset(
                            //                     'assets/svg/shape.svg',
                            //                     color: Colors.white,
                            //                   ),
                            //                 )),
                            //             const SizedBox(
                            //               width: 15,
                            //             ),
                            //             const Text(
                            //               'Website',
                            //               style: TextStyle(
                            //                   color: Color.fromARGB(
                            //                       255, 53, 51, 51),
                            //                   fontWeight: FontWeight.bold,
                            //                   fontSize: 12,
                            //                   fontFamily: 'Roboto'),
                            //             ),
                            //           ],
                            //         ),
                            //         SvgPicture.asset('assets/svg/arrow.svg'),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            lHeightSpan,
                            lHeightSpan,
                            lHeightSpan,
                            lHeightSpan,
                            lHeightSpan,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Positioned(
                //   top: 140,
                //   left: size / 2 - 54,
                //   child: Container(
                //     width: 120,
                //     height: 120,
                //     child: Transform.scale(
                //       scale: 1,
                //       child: Padding(
                //         padding: const EdgeInsets.only(bottom: 30),
                //         child: Container(
                //           decoration: BoxDecoration(
                //               shape: BoxShape.circle, color: Color(0xFF373737)),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Positioned(
                //     top: 100,
                //     left: size / 2 - 20,
                //     child: SvgPicture.asset('assets/svg/verified.svg')),
              ],
            ),
    );
  }
}
