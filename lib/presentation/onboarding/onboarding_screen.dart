import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';
import 'package:my_tasks/presentation/onboarding/widgets/get_started_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 240, 245, 249),
                Color.fromARGB(255, 219, 233, 246),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/onboarding.png',
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manage your daily tasks',
                        style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 9, 28, 77)),
                      ),
                      25.ph,
                      Text(
                        'Team and Project management with solution providing App',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 9, 28, 77),
                        ),
                      ),
                      25.ph,
                      GetStartedButton(
                        onTap: () {
                          print("Ok");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
