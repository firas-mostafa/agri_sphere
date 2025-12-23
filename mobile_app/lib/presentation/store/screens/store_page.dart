import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/store/widget/items_list.dart';
import 'package:mobile_app/presentation/store/widget/search_filter.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth, context.setHeight(100)),
        child: Container(
          color: context.colorScheme.surfaceContainerLowest,
          padding: EdgeInsets.only(
            top: context.setHeight(50),
            left: context.setMineSize(10),
            right: context.setMineSize(10),
            bottom: context.setMineSize(10),
          ),
          child: SearchFilter(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ItemsList(),
            SizedBox(height: context.setHeight(100)),
          ],
        ),
      ),
    );
  }
}
