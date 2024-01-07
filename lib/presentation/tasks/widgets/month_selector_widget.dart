import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';

class MonthSelectorWidget extends StatelessWidget {
  const MonthSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.arrow_back,
              size: 20,
              color: Color.fromARGB(255, 9, 28, 77),
            ),
            5.pw,
            Text(
              "Mar",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color.fromARGB(255, 9, 28, 77),
              ),
            )
          ],
        ),
        Text(
          "April",
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 9, 28, 77),
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        Row(
          children: [
            Text(
              "May",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color.fromARGB(255, 9, 28, 77),
              ),
            ),
            5.pw,
            const Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 9, 28, 77),
              size: 20,
            ),
          ],
        ),
      ],
    );
  }
}
