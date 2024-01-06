import 'package:flutter/material.dart';
import 'package:my_tasks/presentation/common/widgets/avatar_card.dart';

class PileAvatarCard extends StatelessWidget {
  const PileAvatarCard({
    super.key,
    required this.avatarsPaths,
  });

  final List<String> avatarsPaths;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...avatarsPaths.map(
          (avatarPath) => Padding(
            padding: EdgeInsets.only(
                left: 28 * avatarsPaths.indexOf(avatarPath).toDouble()),
            child: AvatarCard(
              size: 40,
              path: avatarPath,
            ),
          ),
        )
      ],
    );
  }
}
