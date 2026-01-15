import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/logic/category_cubit/category_cubit.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'category_item.dart'; // Import the item widget above

class CategoriesSelector extends StatefulWidget {
  final Function(int id) onCategorySelected;

  const CategoriesSelector({super.key, required this.onCategorySelected});

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  int _selectedId = -1;

  @override
  void initState() {
    super.initState();
    // Fetch data when this widget is initialized
    context.read<CategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        // Auto-select the first item on success
        if (state is CategorySuccess &&
            state.categories.isNotEmpty &&
            _selectedId == -1) {
          setState(() {
            _selectedId = state.categories.first.categoryId;
          });
          widget.onCategorySelected(_selectedId);
        }
      },
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoryFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: TextStyle(color: context.colorScheme.error),
            ),
          );
        }

        if (state is CategorySuccess) {
          return SizedBox(
            height: context.setHeight(50),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: context.setMineSize(10),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              separatorBuilder: (_, __) =>
                  SizedBox(width: context.setMineSize(10)),
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return CategoryItem(
                  category: category,
                  isSelected: category.categoryId == _selectedId,
                  onTap: () {
                    setState(() => _selectedId = category.categoryId);
                    widget.onCategorySelected(_selectedId);
                  },
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
