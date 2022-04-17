// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/common/utils/colors_util.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/home/models/teachers_response.dart';
import 'package:flutter/material.dart';

class TutoringTutorWidget extends StatelessWidget {
  final Teachers teacherItem;

  const TutoringTutorWidget({Key? key, required this.teacherItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/instructor_profile',
            arguments: {"id": teacherItem.sId});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: colorBox, borderRadius: BorderRadius.circular(8)),
            height: 72,
            width: 84,
          ),
          sWidthSpan,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                xsHeightSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      teacherItem.name!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "25/hr",
                      // '\$' + price.toString() + '/hr',
                      style: const TextStyle(
                          color: primaryColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Color(0xFFFBB344),
                    ),
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Color(0xFFFBB344),
                    ),
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Color(0xFFFBB344),
                    ),
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Color(0xFFFBB344),
                    ),
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Color(0xFFFBB344),
                    ),
                  ],
                ),
                sHeightSpan,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "SOme description",
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
