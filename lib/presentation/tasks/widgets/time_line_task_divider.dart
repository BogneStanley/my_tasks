import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';

class TimeLineTaskDivider extends StatelessWidget {
  const TimeLineTaskDivider({
    super.key,
    required this.divideTime,
  });
  final String divideTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          divideTime,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 9, 28, 77),
          ),
        ),
        20.pw,
        Expanded(
            child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
            ),
            5.pw,
            const Expanded(
                child: Divider(
              color: Colors.red,
              thickness: 2,
            )),
          ],
        )),
      ],
    );
  }
}
