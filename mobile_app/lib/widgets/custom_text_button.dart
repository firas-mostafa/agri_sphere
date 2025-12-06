import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onTap;

  final String text;

  CustomTextButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
