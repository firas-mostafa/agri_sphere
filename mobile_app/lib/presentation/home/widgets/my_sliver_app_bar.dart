import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/logic/user_cubit/user_cubit.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;

  const MySliverAppBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        children: [
          Icon(
            Icons.eco,
            color: context.colorScheme.onPrimary,
            size: context.setMineSize(40),
          ),
          Text(
            'AgriSphere',
            style: context.textTheme.titleLarge!.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            color: context.colorScheme.onPrimary,
          ),
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (_, state) {
            return CircleAvatar(
              radius: context.setMineSize(25),
              backgroundImage: NetworkImage(
                state is GetProfileDetailsSuccess ? state.userModel.image : "",
              ),
            );
          },
        ),
      ],
      expandedHeight: context.setHeight(380),
      backgroundColor: context.colorScheme.primary,
      collapsedHeight: context.setHeight(80),
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        expandedTitleScale: 1,
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
