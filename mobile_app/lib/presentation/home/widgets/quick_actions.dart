import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/main/logic/index_cubit/index_cubit.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> actions = [
      'pest_library'.tr(context),
      'my_calendar'.tr(context),
      'marketplace'.tr(context),
      'crop_stats'.tr(context),
    ];
    List<String> actionDescription = [
      'your_leatest_pests'.tr(context),
      'view_schedule'.tr(context),
      'buy_products'.tr(context),
      'view_crop_data'.tr(context),
    ];

    List<IconData> actionIcons = [
      Icons.camera_alt_rounded,
      Icons.calendar_month_rounded,
      Icons.store_rounded,
      Icons.eco_outlined,
    ];

    List<Color> actionColors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];

    List<VoidCallback> actionNav = [
      () => Navigator.pushNamed(context, "/pest_reporting"),
      () => context.read<IndexCubit>().changeIndex(1),
      () => context.read<IndexCubit>().changeIndex(2),
      () => Navigator.pushNamed(context, "/pest_reporting"),
    ];
    return SizedBox(
      height: context.setHeight(370),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.setWidth(10),
          mainAxisSpacing: context.setHeight(10),
          childAspectRatio: 3 / 2,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: actionNav[index],
            child: Container(
              padding: EdgeInsets.all(context.setMineSize(12)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.colorScheme.surfaceContainer,
                border: Border.all(
                  color: context.colorScheme.onSurface.withAlpha(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.setMineSize(60),
                    height: context.setMineSize(60),
                    decoration: BoxDecoration(
                      color: actionColors[index].withAlpha(50),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      actionIcons[index],
                      color: actionColors[index],
                      size: context.setHeight(35),
                    ),
                  ),
                  SizedBox(height: context.setHeight(8)),
                  Text(
                    actions[index],
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    actionDescription[index],
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.colorScheme.onSurface.withAlpha(150),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
