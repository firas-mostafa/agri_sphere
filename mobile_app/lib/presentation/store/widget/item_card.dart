import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/widgets/custom_button.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(context.setMineSize(23)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHigh.withAlpha(200),
            borderRadius: BorderRadius.circular(context.setMineSize(23)),
            border: Border.all(
              color: context.colorScheme.outlineVariant.withAlpha(50),
              width: 1,
            ),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.colorScheme.surfaceContainer.withAlpha(100),
                context.colorScheme.surfaceContainerHighest.withAlpha(100),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(context.setMineSize(6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(context.setMineSize(23)),
                      ),
                      child: Image.network(
                        cacheWidth: 400,
                        Random().nextInt(2) == 1
                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1VB0UDDe8tJl9T6gQjIVHMFfq8sONzXFUmA&s"
                            : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiaL5TCM_CCkZIL3GotzVUcAxITnSUBcGDhw&s",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(context.setMineSize(8.0)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondary.withAlpha(100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Product Tag",
                            style: context.textTheme.labelSmall!.copyWith(
                              color: context.colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.setHeight(10)),
                Text(
                  "Product Title",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                Text(
                  "product subtitle demo",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: context.colorScheme.tertiary,
                  ),
                ),
                // rate
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: context.setMineSize(25),
                        );
                      }),
                    ),
                    SizedBox(width: context.setMineSize(8)),
                    Text(
                      "4.0",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.setHeight(6)),

                /// rate end
                Text(
                  "10\$",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.secondary,
                  ),
                ),
                SizedBox(height: context.setHeight(6)),
                CustomButton(
                  onTap: () {},
                  text: "Buy Now",
                  height: context.setHeight(50),
                  color: context.colorScheme.primary,
                  titleColor: context.colorScheme.onPrimary,
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
