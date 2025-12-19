import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/home/widgets/farming_calander.dart';
import 'package:mobile_app/presentation/home/widgets/header.dart';
import 'package:mobile_app/presentation/home/widgets/my_sliver_app_bar.dart';
import 'package:mobile_app/presentation/home/widgets/quick_actions.dart';
import 'package:mobile_app/presentation/home/widgets/today_tasks.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, builder) => [
          MySliverAppBar(child: Header()),
        ],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.setMineSize(10)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.setHeight(20)),
                Text(
                  'quick_actions'.tr(context),
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                QuickActions(),
                Text(
                  'today_tasks'.tr(context),
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TodayTasks(),
                Text(
                  'farming_calander'.tr(context),
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FarmingCalander(),
                SizedBox(height: context.setHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
