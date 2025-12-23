import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/widgets/custom_button.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(context.setMineSize(25)),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.shadow.withAlpha(80),
                blurRadius: 12,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.setMineSize(25)),
                  topRight: Radius.circular(context.setMineSize(25)),
                ),
                child: IntrinsicHeight(
                  child: Image.network(
                    cacheWidth: 400,
                    Random().nextInt(2) == 1
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1VB0UDDe8tJl9T6gQjIVHMFfq8sONzXFUmA&s"
                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiaL5TCM_CCkZIL3GotzVUcAxITnSUBcGDhw&s",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.setMineSize(20.0),
                  vertical: context.setMineSize(10),
                ),
                child: Text(
                  "Product Title",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: context.colorScheme.tertiary,
                  ),
                ),
              ),
              // rate
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.setMineSize(20.0),
                  vertical: context.setMineSize(4),
                ),
                child: Row(
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
              ),

              /// rate end
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.setMineSize(20.0),
                  vertical: context.setMineSize(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10\$",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.setMineSize(7),
                  vertical: context.setMineSize(5),
                ),
                child: CustomButton(
                  onTap: () {},
                  text: "Buy Now",
                  color: context.colorScheme.primaryContainer,
                  titleColor: context.colorScheme.onPrimaryContainer,
                  icon: Icons.shopping_cart_outlined,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(context.setMineSize(8.0)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryFixed,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Product Tag",
                style: TextStyle(
                  color: context.colorScheme.onPrimaryFixed,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
