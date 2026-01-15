import 'package:equatable/equatable.dart' show Equatable;
import 'package:mobile_app/core/api/end_ponits.dart';

class CategoryModel extends Equatable {
  final int categoryId;
  final String name;

  const CategoryModel({required this.categoryId, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      categoryId: jsonData[ApiKey.categoryId],
      name: jsonData[ApiKey.name],
    );
  }
  @override
  List<Object?> get props => [categoryId, name];
}
