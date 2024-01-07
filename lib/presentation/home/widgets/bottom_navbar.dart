import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedItem = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      items: [
        buttomNavBarItem(
          label: "Home",
          svgPath: "assets/icons/home.svg",
          isActive: selectedItem == 0,
        ),
        buttomNavBarItem(
          label: "file",
          svgPath: "assets/icons/file.svg",
          size: 22,
          isActive: selectedItem == 1,
        ),
        buttomNavBarItem(
          label: "user",
          svgPath: "assets/icons/user.svg",
          isActive: selectedItem == 2,
        ),
        buttomNavBarItem(
          label: "notif",
          svgPath: "assets/icons/notif.svg",
          isActive: selectedItem == 3,
        ),
      ],
      onTap: (value) {
        setState(() {
          selectedItem = value;
        });
      },
    );
  }
}

BottomNavigationBarItem buttomNavBarItem(
    {required String label,
    required String svgPath,
    bool isActive = false,
    double size = 25}) {
  return BottomNavigationBarItem(
    label: label,
    icon: SvgPicture.asset(
      svgPath,
      width: size,
      colorFilter: ColorFilter.mode(
        isActive ? const Color.fromARGB(255, 28, 213, 255) : Colors.white,
        BlendMode.srcIn,
      ),
    ),
  );
}
