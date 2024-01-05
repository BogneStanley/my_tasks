import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  double buttonWidth = 60;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          buttonWidth = MediaQuery.of(context).size.width;
        });
        await Future.delayed(const Duration(seconds: 1));
        widget.onTap();
      },
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            height: 60,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: buttonWidth,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 20, 54, 138)
                        .withOpacity(0.15),
                    blurRadius: 15,
                    offset: const Offset(-4, 8),
                  )
                ],
                color: const Color.fromARGB(255, 240, 245, 249),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Get Started",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 9, 28, 77),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
