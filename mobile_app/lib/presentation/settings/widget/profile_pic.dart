import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.setMineSize(160),
      height: context.setMineSize(160),
      child: Stack(
        children: [
          CircleAvatar(
            radius: context.setMineSize(80),
            backgroundColor: context.colorScheme.surfaceContainerHigh,
            child: CircleAvatar(
              radius: context.setMineSize(75),
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
              backgroundColor: context.colorScheme.primary,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: context.colorScheme.surfaceContainerHigh,
              radius: context.setMineSize(20),
              child: Icon(
                Icons.camera_alt,
                size: context.setMineSize(25),
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
