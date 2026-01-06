import 'package:equatable/equatable.dart' show Equatable;

class ProductModel extends Equatable {
  final int categoryId;
  final int brandId;
  final bool isActive;

  const ProductModel({
    required this.categoryId,
    required this.brandId,
    required this.isActive,
  });

  @override
  List<Object?> get props => [categoryId, brandId, isActive];
}
