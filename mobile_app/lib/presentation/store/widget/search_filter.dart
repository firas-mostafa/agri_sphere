import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/widgets/custom_text_field.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SizedBox(
      width: context.setWidth(400),
      height: context.setHeight(45) > 45 ? context.setHeight(45) : 45,
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              onFieldSubmitted: (_) {},
              textInputAction: TextInputAction.done,
              focusNode: FocusNode(),
              controller: controller,
              text: "Search",
              suffix: SizedBox(
                height: context.setMineSize(5),
                width: context.setMineSize(5),
                child: Center(
                  child: Icon(
                    Icons.search,
                    size: context.setMineSize(20),
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: context.setMineSize(10)),
          InkWell(
            onTap: () {},
            child: Container(
              width: context.setMineSize(50),
              height: double.infinity,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(context.setMineSize(10)),
              ),
              child: Center(
                child: Icon(
                  Icons.filter_list,
                  size: context.setMineSize(25),
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
