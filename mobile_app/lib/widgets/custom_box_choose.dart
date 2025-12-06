import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class CustomBoxChoose extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String image;
  final double size;
  const CustomBoxChoose({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
    this.size = 210,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.setMineSize(size),
        height: context.setMineSize(size),

        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(context.setMineSize(30)),
          border: Border.all(
            color: context.colorScheme.outlineVariant,
            width: 2,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: context.setMineSize(size * 0.5),
                child: Image.asset(image),
              ),
              Text(text, style: context.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
