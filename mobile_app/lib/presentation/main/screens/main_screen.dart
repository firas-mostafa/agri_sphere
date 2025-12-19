import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/image/image_helper.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/home/screens/home_page.dart';
import 'package:mobile_app/presentation/main/logic/index_cubit/index_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomePage(), HomePage(), HomePage()];
    return BlocProvider(
      create: (context) => IndexCubit(),
      child: Builder(
        builder: (indexContext) {
          return Scaffold(
            body: screens[indexContext.watch<IndexCubit>().state.indexValue],
            extendBody: true,
            bottomNavigationBar: CrystalNavigationBar(
              splashBorderRadius: context.setMineSize(50),
              splashColor: context.colorScheme.primary.withAlpha(50),
              currentIndex: indexContext.watch<IndexCubit>().state.indexValue,
              onTap: (index) {
                indexContext.read<IndexCubit>().changeIndex(index);
              },
              indicatorColor: context.colorScheme.primary,
              // enableFloatingNavBar: false,
              items: [
                /// Favourite
                CrystalNavigationBarItem(
                  icon: Icons.home,
                  unselectedIcon: Icons.home_outlined,
                  selectedColor: context.colorScheme.primary,
                ),

                /// Market
                CrystalNavigationBarItem(
                  icon: Icons.store,
                  unselectedIcon: Icons.store_outlined,
                  selectedColor: context.colorScheme.primary,
                ),

                /// Profile
                CrystalNavigationBarItem(
                  icon: Icons.person,
                  unselectedIcon: Icons.person_outline,
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
