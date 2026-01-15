import 'package:equatable/equatable.dart';
import 'package:mobile_app/core/api/end_ponits.dart';

class PrandModel extends Equatable {
  final int brandId;
  final String name;

  const PrandModel({required this.brandId, required this.name});

  factory PrandModel.fromJson(Map<String, dynamic> jsonData) {
    return PrandModel(
      brandId: jsonData[ApiKey.brandId],
      name: jsonData[ApiKey.name],
    );
  }
  @override
  List<Object?> get props => [brandId, name];
}
