import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
    required this.path,
    this.size = 50,
  });
  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white,
            width: 3,
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(path),
      ),
    );
  }
}
