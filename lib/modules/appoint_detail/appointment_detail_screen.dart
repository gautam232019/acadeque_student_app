import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/modules/appoint_detail/appointment_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class AppointmentDetailScreen extends StatelessWidget {
  const AppointmentDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppointmentDetailState>(context);
    final double size = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: primaryColor,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    'assets/svg/arrow_back.svg'),
                              ),
                            ),
                            Text(
                              '${state.appointmentDetails!.data!.appointment!.duration.toString()} Mins Session',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/notifications");
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
                      height: size * 0.2,
                      decoration: const BoxDecoration(
                          color: Color(0xFF59AEFD),
                          image: DecorationImage(
                              image: AssetImage('assets/images/bg_shape.png'),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        padding: sPagePadding,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network(state.appointmentDetails!
                                    .data!.appointment!.studentId!.profileURL!),
                                height: 163,
                                width: 329,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey,
                                ),
                              ),
                              mHeightSpan,
                              Text(
                                state.appointmentDetails!.data!.appointment!
                                    .studentId!.name!,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              sHeightSpan,
                              Row(
                                children: [
                                  Text(
                                    "${Jiffy(state.appointmentDetails!.data!.appointment!.from).format("hh:mm")} to ${Jiffy(state.appointmentDetails!.data!.appointment!.to).format("hh:mm")}",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  sWidthSpan,
                                  const Text(
                                    "|",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  sWidthSpan,
                                  Text(
                                    Jiffy(state.appointmentDetails!.data!
                                            .appointment!.from)
                                        .format("dd MMM yyyy"),
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              lHeightSpan,
                              const Text(
                                "Some detailssdfkldsjflk s;fjsdlfkjds fksldfjsdl;kjf  sdfjdsfl djslfksd fl;ksdjfs d;fljks f;kldsjf ;klajf skjldk f;alskjf slk;jfk sda;lkfjds akljsdf s;lkjfk k",
                              ),
                              lHeightSpan,
                              if (state.appointmentDetails!.data!.appointment!
                                      .status! ==
                                  "completed")
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                )
                              else
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Join"),
                                ),
                            ],
                          ),
                        ),
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
                              bottomRight: Radius.zero),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
