import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'
    show MasonryGridView;
import 'package:mobile_app/helpers/responsive/device_utils.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/presentation/store/widget/item_card.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.valueDecider<double>(
          context,
          onMobile: context.screenWidth * 0.03,
          onTablet: context.screenWidth * 0.05,
          onDesktop: context.screenWidth * 0.1,
        ),
        vertical: context.setMineSize(25),
      ),
      crossAxisCount: DeviceUtils.valueDecider<int>(
        context,
        onMobile: 2,
        onTablet: 3,
        onDesktop: 5,
      ),
      mainAxisSpacing: context.setMineSize(15),
      crossAxisSpacing: context.setMineSize(15),
      itemCount: 10,
      itemBuilder: (context, index) => ItemCard(),
    );
  }
}
