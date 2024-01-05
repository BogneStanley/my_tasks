import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskInfoCard extends StatelessWidget {
  const TaskInfoCard({
    super.key,
    required this.taskQuantity,
    required this.label,
  });
  final int taskQuantity;
  final String label;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 6, 26, 78).withOpacity(0.2),
            blurRadius: 15,
          )
        ],
        color: const Color.fromARGB(255, 105, 114, 231),
        borderRadius: BorderRadius.circular(15),
      ),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$taskQuantity",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 205, 211, 245),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
