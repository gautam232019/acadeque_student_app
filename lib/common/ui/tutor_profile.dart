import 'package:flutter/material.dart';

class TutorProfile extends StatefulWidget {
  const TutorProfile({Key? key, required this.name, required this.rating})
      : super(key: key);
  final String name;
  final String rating;

  @override
  State<TutorProfile> createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  Future fetchTeachers() async {}
  Widget build(BuildContext context) {
    return Row(
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
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 50,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
            Text(widget.rating)
          ],
        )
      ],
    );
  }
}
