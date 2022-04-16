import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingRowWidget extends StatelessWidget {
  final String title;
  final int count;

  const RatingRowWidget({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                  'assets/svg/${title == 'Very Satisfied' ? 'versat' : title == 'Satisfied' ? 'satisfied' : title == 'Neutral' ? 'neutral' : 'poor'}.svg'),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF373737),
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5,
                  fontFamily: 'Roboto',
                ),
              )
            ],
          ),
          Text(
            count.toString(),
            style: TextStyle(
              color: Color(0xFF373737),
              fontWeight: FontWeight.bold,
              fontSize: 13.5,
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}
