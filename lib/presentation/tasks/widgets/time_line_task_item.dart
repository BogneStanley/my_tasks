import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';
import 'package:my_tasks/presentation/common/widgets/task_item.dart';

class TimeLineTaskItem extends StatelessWidget {
  const TimeLineTaskItem(
      {super.key, required this.startTime, required this.endTime});
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.ph,
                Text(
                  startTime.replaceFirst(".00", ""),
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 9, 28, 77),
                  ),
                ),
                customExpanded,
                Text(
                  endTime.replaceFirst(".00", ""),
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 9, 28, 77),
                  ),
                ),
                15.ph,
              ],
            ),
            30.pw,
            Expanded(
                child: TaskItem(
              showBoxShadow: false,
              startTime: startTime,
              endTime: endTime,
            ))
          ],
        ),
      ),
    );
  }
}
