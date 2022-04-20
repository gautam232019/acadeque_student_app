import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/appointment_item.dart';
import 'package:acadeque_student_app/common/ui/ask_container.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/appointment_screen/appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    final state = Provider.of<AppointmentState>(context);

    return Container(
      color: primaryColor,
      child: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(''),
                  Text(
                    'Your Appointments',
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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: state.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.appointmentState?.data?.appointments?.isEmpty ?? true
                      ? const Center(
                          child: Text("No Appointments"),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: state
                                .appointmentState!.data!.appointments!
                                .map((e) => AppointmentItem(item: e))
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
