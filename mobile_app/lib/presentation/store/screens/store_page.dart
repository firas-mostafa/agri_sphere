import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/image/image_helper.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/store/widget/items_list.dart';
import 'package:mobile_app/presentation/store/widget/search_filter.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,

      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth, context.setHeight(100)),
        child: Container(
          color: context.colorScheme.surface.withAlpha(10),
          padding: EdgeInsets.only(
            top: context.setHeight(50),
            left: context.setMineSize(10),
            right: context.setMineSize(10),
            bottom: context.setMineSize(10),
          ),
          child: SearchFilter(),
        ),
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Image.asset(
              ImageHelper.leaf,
              width: context.screenWidth,
              height: context.screenHeight,
              fit: BoxFit.fitHeight,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ItemsList(),
                    SizedBox(height: context.setHeight(100)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
