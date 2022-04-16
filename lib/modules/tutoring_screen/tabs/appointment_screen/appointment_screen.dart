import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/ask_container.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
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
                  Text(''),
                  const Text(
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
            decoration: BoxDecoration(
                color: Color(0xFF59AEFD),
                image: DecorationImage(
                    image: new AssetImage('assets/images/bg_shape.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero)),
            height: size * 0.8 - 68,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListView(
                children: [
                  // AskContainer(
                  //     isSolved: false,
                  //     question:
                  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry.?',
                  //     desc:
                  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
                  // Divider(),
                  // AskContainer(
                  //     isSolved: true,
                  //     question:
                  //         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum?',
                  //     desc:
                  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
                  // Divider(),
                  // AskContainer(
                  //     isSolved: true,
                  //     question:
                  //         'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout?',
                  //     desc:
                  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
                  // Divider(),
                  // AskContainer(
                  //     isSolved: true,
                  //     question:
                  //         'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout?',
                  //     desc:
                  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
                  // Divider(),
                  // AskContainer(
                  //     isSolved: true,
                  //     question:
                  //         'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout?',
                  //     desc:
                  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
