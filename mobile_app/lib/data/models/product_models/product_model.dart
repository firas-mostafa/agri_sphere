import 'package:equatable/equatable.dart' show Equatable;

class ProductModel extends Equatable {
  final int productId;
  final int categoryId;
  final int brandId;
  final ProductType productType;
  final int stockQuantity;
  final String name;
  final String description;
  final String shortDescription;
  final String image;
  final String barcode;
  final String sku;
  final double averageRating;
  final int totalReviews;

  const ProductModel({
    required this.productType,
    required this.productId,
    required this.categoryId,
    required this.brandId,
    required this.stockQuantity,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.image,
    required this.barcode,
    required this.sku,
    required this.averageRating,
    required this.totalReviews,
  });
  // factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
  //   return ProductModel(
  //     productId: null,
  //     categoryId: null,
  //     brandId: null,
  //     stockQuantity: null,
  //     name: '',
  //     description: '',
  //     shortDescription: '',
  //     image: '',
  //     barcode: '',
  //     sku: '',
  //     average_rating: null,
  //     total_reviews: null,
  //   );
  // }

  @override
  List<Object?> get props => [
    productId,
    categoryId,
    brandId,
    stockQuantity,
    name,
    description,
    shortDescription,
    image,
    barcode,
    sku,
    averageRating,
    totalReviews,
  ];
}

enum ProductType { test }
