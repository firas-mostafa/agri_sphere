import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/data/models/product_models.dart/category_model.dart';
import 'package:mobile_app/data/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  final CategoryRepository categoryRepository;

  Future<void> getCategories() async {
    emit(CategoryLoading());

    final result = await categoryRepository.getCategories();

    result.fold(
      (failureMessage) {
        emit(CategoryFailure(errMessage: failureMessage));
      },
      (categoriesList) {
        emit(CategorySuccess(categories: categoriesList));
      },
    );
  }
}
