import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/settings/widget/language_changer.dart';
import 'package:mobile_app/presentation/settings/widget/profile_pic.dart';
import 'package:mobile_app/presentation/settings/widget/settings_theme_switcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.setMineSize(20),
          vertical: context.setMineSize(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ProfilePic(),
                  SizedBox(height: context.setMineSize(10)),
                  Text(
                    "Firas Mostafa",
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "member since Dec 22",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurfaceVariant.withAlpha(
                        180,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: context.colorScheme.outlineVariant),
            Text('general'.tr(context), style: context.textTheme.headlineSmall),
            SizedBox(height: context.setMineSize(20)),
            SettingsThemeSwitcher(),
            SizedBox(height: context.setMineSize(10)),
            LanguageChanger(),
          ],
        ),
      ),
    );
  }
}
