import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.titleColor,
    this.icon,
  });
  final Function()? onTap;
  final String text;
  final Color? color;
  final Color? titleColor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? context.colorScheme.primary;
    final textColor = titleColor ?? context.colorScheme.onPrimary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.setHeight(60),
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(context.setMineSize(23)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != null ? Icon(icon, color: textColor) : SizedBox(),
              SizedBox(width: context.setMineSize(10)),
              Text(
                text,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
