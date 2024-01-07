import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';
import 'package:my_tasks/data/fake/weekly_day.dart';
import 'package:my_tasks/presentation/common/widgets/avatar_card.dart';
import 'package:my_tasks/presentation/tasks/widgets/day_card.dart';
import 'package:my_tasks/presentation/tasks/widgets/month_selector_widget.dart';
import 'package:my_tasks/presentation/tasks/widgets/time_line_task_divider.dart';
import 'package:my_tasks/presentation/tasks/widgets/time_line_task_item.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    super.key,
    required this.label,
  });
  final String label;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            side: BorderSide(
                              color: Color.fromARGB(255, 201, 210, 228),
                              width: 2,
                            )),
                      )),
                    ),
                    customExpanded,
                    const AvatarCard(
                      path: "assets/images/profile1.jpg",
                    ),
                  ],
                ),
                30.ph,
                const MonthSelectorWidget(),
                30.ph,
                SizedBox(
                  width: size.width,
                  height: 120,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return DayCard(
                        dayNumber: index + 1,
                        label: weeklyDay[index % 6].substring(0, 3),
                        isActive: index == 0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemCount: 30,
                    itemExtent: (size.width / 4) - 15,
                  ),
                ),
                20.ph,
                Text(
                  widget.label,
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 9, 28, 77),
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                20.ph,
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return index != 1
                          ? TimeLineTaskItem(
                              startTime: "${index + 1}.00 AM",
                              endTime: "${index + 2}.00 PM",
                            )
                          : TimeLineTaskDivider(
                              divideTime: "${index + 1} AM",
                            );
                    },
                    itemCount: 10,
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
