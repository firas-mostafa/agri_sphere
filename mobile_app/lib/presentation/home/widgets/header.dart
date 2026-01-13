import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/home/widgets/weather_card.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = MaterialLocalizations.of(context).formatShortMonthDay(now);
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
      padding: EdgeInsets.symmetric(horizontal: context.setWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.setHeight(130)),
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
                        today,
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
          SizedBox(height: context.setHeight(20)),
          // Weather card
          WeatherCard(),
        ],
      ),
    );
  }
}
