import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/core/tools/custom_extention.dart';
import 'package:my_tasks/data/fake/weekly_day.dart';
import 'package:my_tasks/presentation/common/widgets/avatar_card.dart';
import 'package:my_tasks/presentation/common/widgets/task_item.dart';

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
            Expanded(
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
