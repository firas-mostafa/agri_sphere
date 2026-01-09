import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ProductImageModel extends Equatable {
  final int productImageId;
  final int productID;
  final XFile image;

  const ProductImageModel({
    required this.productImageId,
    required this.productID,
    required this.image,
  });

  @override
  List<Object?> get props => [productImageId, productID, image];
}
