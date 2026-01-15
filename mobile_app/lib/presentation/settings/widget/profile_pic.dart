import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class ProfilePic extends StatelessWidget {
  final String image;
  const ProfilePic(this.image, {super.key});

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

              backgroundImage: NetworkImage(image),
              backgroundColor: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
