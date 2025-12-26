import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.setWidth(15),
        vertical: context.setHeight(43),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.setHeight(79)),
          // Top bar: logo / title / actions
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'welcome_back'.tr(context),
                      style: context.textTheme.titleSmall!.copyWith(
                        color: context.colorScheme.onPrimary.withAlpha(180),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.setHeight(2)),
                    Text(
                      "Firas Mostafa",
                      style: context.textTheme.titleLarge!.copyWith(
                        color: context.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(context.setMineSize(10)),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withAlpha(60),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'today'.tr(context),
                        style: context.textTheme.titleSmall!.copyWith(
                          color: context.colorScheme.onPrimary.withAlpha(180),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.setHeight(2)),
                      Text(
                        "Aug 14",
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Weather card
          Center(
            child: Container(
              width: context.screenWidth * 0.92,
              padding: EdgeInsets.all(context.setMineSize(16)),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withAlpha(60),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'current_weather'.tr(context),
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '28°C',
                          style: TextStyle(
                            color: context.colorScheme.onPrimary,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Sunny, Perfect for crops',
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          color: context.colorScheme.onPrimary,
                          size: 24,
                        ),
                        SizedBox(height: context.setHeight(40)),
                        Text(
                          '${'humidity'.tr(context)}: 65%',
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '${'wind'.tr(context)}: 12 km/h',
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
