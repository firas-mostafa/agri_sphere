import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/localization/logic/localization_cubit.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/engineers/screens/engineers_page.dart';
import 'package:mobile_app/presentation/home/screens/home_page.dart';
import 'package:mobile_app/presentation/main/logic/index_cubit/index_cubit.dart';
import 'package:mobile_app/presentation/settings/screens/settings_page.dart';
import 'package:mobile_app/presentation/store/screens/store_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(),
      SettingsPage(),
      StorePage(),
      EngineersPage(),
      SettingsPage(),
    ];
    return BlocProvider(
      create: (context) => IndexCubit(),
      child: Builder(
        builder: (indexContext) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pest_reporting');
              },
              disabledElevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              shape: CircleBorder(),
              splashColor: context.colorScheme.onPrimary.withAlpha(50),
              child: Icon(Icons.camera),
            ),
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endContained,
            body: screens[indexContext.watch<IndexCubit>().state.indexValue],
            extendBody: true,
            bottomNavigationBar: CrystalNavigationBar(
              marginR: EdgeInsets.only(
                left:
                    context.read<LocaleCubit>().state.locale ==
                        const Locale('en')
                    ? context.setMineSize(5)
                    : context.setMineSize(100),
                right:
                    context.read<LocaleCubit>().state.locale ==
                        const Locale('en')
                    ? context.setMineSize(100)
                    : context.setMineSize(5),
                bottom: context.setMineSize(27),
                top: context.setMineSize(27),
              ),
              height: context.setMineSize(50),
              splashBorderRadius: context.setMineSize(50),
              splashColor: context.colorScheme.primary.withAlpha(50),
              currentIndex: indexContext.watch<IndexCubit>().state.indexValue,
              onTap: (index) {
                indexContext.read<IndexCubit>().changeIndex(index);
              },
              indicatorColor: context.colorScheme.primary,
              outlineBorderColor: context.colorScheme.outlineVariant,
              items: [
                /// Favourite
                CrystalNavigationBarItem(
                  icon: Icons.home,
                  unselectedIcon: Icons.home_outlined,
                  selectedColor: context.colorScheme.primary,
                ),

                ///calender
                CrystalNavigationBarItem(
                  icon: Icons.calendar_month,
                  unselectedIcon: Icons.calendar_month_outlined,
                  selectedColor: context.colorScheme.primary,
                ),

                /// Market
                CrystalNavigationBarItem(
                  icon: Icons.store,
                  unselectedIcon: Icons.store_outlined,
                  selectedColor: context.colorScheme.primary,
                ),

                /// engineers
                CrystalNavigationBarItem(
                  icon: Icons.engineering,
                  unselectedIcon: Icons.engineering_outlined,
                  selectedColor: context.colorScheme.primary,
                ),

                /// settings
                CrystalNavigationBarItem(
                  icon: Icons.settings,
                  unselectedIcon: Icons.settings_outlined,
                  selectedColor: context.colorScheme.primary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
