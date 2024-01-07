import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required this.dayNumber,
    required this.label,
    this.isActive = false,
  });
  final int dayNumber;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 6, 26, 78).withOpacity(0.2),
              blurRadius: 15,
            )
          ],
          color: isActive
              ? const Color.fromARGB(255, 105, 114, 231)
              : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$dayNumber",
              style: GoogleFonts.poppins(
                color: isActive
                    ? Colors.white
                    : const Color.fromARGB(255, 50, 58, 167),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: isActive
                    ? Colors.white
                    : const Color.fromARGB(255, 95, 105, 236),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
