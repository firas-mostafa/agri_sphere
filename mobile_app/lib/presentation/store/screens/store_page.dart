import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/store/widget/categories_selector.dart';
import 'package:mobile_app/presentation/store/widget/falling_dots.dart';
import 'package:mobile_app/presentation/store/widget/items_list.dart';
import 'package:mobile_app/presentation/store/widget/search_filter.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: _buildAppBar(context),
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Positioned.fill(child: FallingDots()),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: context.setHeight(20)),

                    // CLEAN: Just one widget handling all category logic
                    CategoriesSelector(
                      onCategorySelected: (id) {
                        // TODO: Use this ID to filter your ItemsList
                        print("Category Selected: $id");
                      },
                    ),

                    SizedBox(height: context.setHeight(20)),
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

  // Helper method to keep build() clean
  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
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
    );
  }
}
