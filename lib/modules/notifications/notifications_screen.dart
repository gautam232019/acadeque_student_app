import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 227,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.cover),
              ),
              child: const Center(
                child: Text(
                  "",
                  style: TextStyle(
                      color: Color(0xFF373737),
                      fontFamily: 'Roboto',
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lHeightSpan,
                lHeightSpan,
                Row(
                  children: [
                    lWidthSpan,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 40,
                        width: 40,
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
                lHeightSpan,
                lHeightSpan,
                Row(
                  children: const [
                    lWidthSpan,
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                lHeightSpan,
                Row(
                  children: const [
                    lWidthSpan,
                    Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                mHeightSpan,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lWidthSpan,
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 30,
                    ),
                    sWidthSpan,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sHeightSpan,
                          Row(
                            children: [
                              const Text(
                                "Admin",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              sWidthSpan,
                              Column(
                                children: const [
                                  sHeightSpan,
                                  Text(
                                    "2h 47m ago",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          sHeightSpan,
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "kear khau sdklfaljfsld fjal;fjdskflajsfk jsdaf;ldksjf adsl;jfsa;flkjsd;flk jsafkl;djs fa;fjsdf ",
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lWidthSpan,
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                    ),
                    sWidthSpan,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sHeightSpan,
                          Row(
                            children: [
                              const Text(
                                "Tutor",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              sWidthSpan,
                              Column(
                                children: const [
                                  sHeightSpan,
                                  Text(
                                    "2h 47m ago",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          sHeightSpan,
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "kear khau sdklfaljfsld fjal;fjdskflajsfk jsdaf;ldksjf adsl;jfsa;flkjsd;flk jsafkl;djs fa;fjsdf ",
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
