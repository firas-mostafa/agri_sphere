import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class TipsForScanning extends StatelessWidget {
  const TipsForScanning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.setMineSize(10)),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.setMineSize(20)),
            child: Icon(Icons.lightbulb, color: context.colorScheme.tertiary),
          ),
          SizedBox(width: context.setWidth(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "tips_for_best_results".tr(context),
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " • ${"capture_clear,well-lit_images".tr(context)}",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.tertiary,
                ),
              ),
              Text(
                " • ${"focus_on_the_pest_or_damaged_area".tr(context)}",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.tertiary,
                ),
              ),
              Text(
                " • ${"avoid_blurry_or_distant_shots".tr(context)}",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
