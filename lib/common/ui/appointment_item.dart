import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tabs/appointment_screen/models/appointment_response.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

// ignore: must_be_immutable
class AppointmentItem extends StatelessWidget {
  Appointments item;
  AppointmentItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 22, right: 22, top: 15, bottom: 15),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/appointment_detail",
                  arguments: item.sId);
              // Navigator.pushNamed(context, "/question_screen", arguments: item);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 103,
                  width: 114,
                  child: Stack(
                    children: [
                      // Image.network(
                      //   item!.mediaURL!,
                      //   fit: BoxFit.cover,
                      //   width: double.infinity,
                      // ),
                      const Text(''),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF59AEFD),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: item.status == "completed"
                                ? const Text("Completed")
                                : const Text('Pending'),
                            // item!.solved == true ? 'Solved' : 'Pending'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF33354E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      sHeightSpan,
                      Text(
                        item.type!,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        Jiffy(item.createdAt!).fromNow(),
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                            color: Color(0xFFA1A1A1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
