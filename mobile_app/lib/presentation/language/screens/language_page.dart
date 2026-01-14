import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/image/image_helper.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/localization/logic/localization_cubit.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/widgets/custom_box_choose.dart';
import 'package:mobile_app/widgets/theme_switcher.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [ThemeSwitcher()]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "choose_your_language".tr(context),
              style: context.textTheme.headlineMedium,
            ),
            SizedBox(height: context.setHeight(40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBoxChoose(
                  text: 'English',
                  image: ImageHelper.english,
                  onTap: () {
                    context.read<LocaleCubit>().changeLanguage('en');
                    Navigator.pushNamed(context, "/main");
                  },
                ),
                CustomBoxChoose(
                  text: 'العربية',
                  image: ImageHelper.arabic,
                  onTap: () {
                    context.read<LocaleCubit>().changeLanguage('ar');
                    Navigator.pushNamed(context, "/main");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
