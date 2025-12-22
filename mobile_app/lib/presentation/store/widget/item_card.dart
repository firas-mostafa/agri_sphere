import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

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
                blurRadius: 30,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(context.setMineSize(25)),
                child: IntrinsicHeight(
                  child: Image.network(
                    cacheWidth: 400,

                    'https://via.placeholder.com/300x300.png?text=Product',
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
              Padding(
                padding: EdgeInsets.all(context.setMineSize(20.0)),
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
            ],
          ),
        ),
      ],
    );
  }
}
