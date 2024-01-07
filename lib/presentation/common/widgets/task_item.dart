import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';
import 'package:my_tasks/presentation/common/widgets/pile_avatar_card.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    this.showBoxShadow = true,
    this.startTime,
    this.endTime,
  });

  final bool showBoxShadow;
  final String? startTime;
  final String? endTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: [
          if (showBoxShadow)
            BoxShadow(
              color: const Color.fromARGB(255, 6, 26, 78).withOpacity(0.5),
              blurRadius: 100,
            )
        ],
        color: const Color.fromARGB(255, 105, 114, 231),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mobile App Design",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Mike and Anita",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 205, 211, 245),
                fontSize: 12,
              ),
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PileAvatarCard(avatarsPaths: [
                  "assets/images/profile1.jpg",
                  "assets/images/profile2.jpg",
                ]),
                Text(
                  (startTime != null && endTime != null)
                      ? "$startTime - $endTime"
                      : "Now",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 205, 211, 245),
                    fontSize: 11,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
