import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/api/api_consumer.dart';
import 'package:mobile_app/core/api/end_ponits.dart';
import 'package:mobile_app/core/errors/exceptions.dart';
import 'package:mobile_app/data/models/product_models.dart/category_model.dart';

class CategoryRepository {
  final ApiConsumer apiConsumer;

  CategoryRepository(this.apiConsumer);

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiConsumer.get(EndPoint.getCategories);

      List<dynamic> dataList = response['data'];

      final List<CategoryModel> categories = dataList
          .map((jsonItem) => CategoryModel.fromJson(jsonItem))
          .toList();

      return Right(categories);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
