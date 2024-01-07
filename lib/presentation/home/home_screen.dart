import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';
import 'package:my_tasks/presentation/common/widgets/avatar_card.dart';
import 'package:my_tasks/presentation/common/widgets/pile_avatar_card.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:my_tasks/presentation/common/widgets/task_info_card.dart';
import 'package:my_tasks/presentation/common/widgets/task_item.dart';
import 'package:my_tasks/presentation/home/widgets/bottom_navbar.dart';
import 'package:my_tasks/presentation/tasks/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 138, 132, 224),
              Color.fromARGB(255, 71, 47, 183),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: -30,
                top: -35,
                child: Image.asset(
                  "assets/images/home.png",
                  width: 310,
                  height: 350,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/menu_icon.svg",
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        customExpanded,
                        const AvatarCard(
                          path: "assets/images/profile1.jpg",
                        ),
                      ],
                    ),
                    35.ph,
                    Text(
                      "Hi Ghulam",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "6 Tasks are pending",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 205, 211, 245),
                      ),
                    ),
                    20.ph,
                    const TaskItem(),
                    40.ph,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Monthly Review",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: cupertino.Icon(
                              cupertino.CupertinoIcons.calendar,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 28, 213, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.ph,
                    Expanded(
                      child: Row(children: [
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const TasksScreen(
                                          label: "Done",
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TaskInfoCard(
                                      taskQuantity: 22, label: "Done"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const TasksScreen(
                                            label: "Ongoing");
                                      },
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TaskInfoCard(
                                      taskQuantity: 10, label: "Ongoing"),
                                ),
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const TasksScreen(
                                            label: "In Progess");
                                      },
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TaskInfoCard(
                                      taskQuantity: 7, label: "In Progess"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const TasksScreen(
                                            label: "Waiting for review");
                                      },
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TaskInfoCard(
                                      taskQuantity: 12,
                                      label: "Waiting for review"),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ]),
                    ),
                    const BottomNavBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
