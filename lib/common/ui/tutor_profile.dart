import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/home/models/teachers_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TutorProfile extends StatefulWidget {
  TutorProfile({Key? key, required this.teacherItem}) : super(key: key);
  late Teachers? teacherItem;

  @override
  State<TutorProfile> createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  Future fetchTeachers() async {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.teacherItem!.sId != null) {
          Navigator.pushNamed(context, "/instructor_profile", arguments: {
            'id': widget.teacherItem!.sId,
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF33354E),
                    borderRadius: BorderRadius.circular(8)),
                height: 72,
                width: 84,
                child: widget.teacherItem!.profileURL!.isNotEmpty
                    ? Image.network(
                        widget.teacherItem!.profileURL!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : null,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.teacherItem!.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  xsHeightSpan,
                  if (widget.teacherItem!.hourlyRate == 0)
                    const Text("Not rated")
                  else
                    Text("\$${widget.teacherItem!.hourlyRate.toString()}/hr"),
                  xsHeightSpan,
                  const Text(
                    'Expertise',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFA1A1A1),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Color(0xFFFBB344),
              ),
              Text(widget.teacherItem!.avgRating!.toString())
            ],
          )
        ],
      ),
    );
  }
}
