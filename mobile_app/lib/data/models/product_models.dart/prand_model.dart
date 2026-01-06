import 'package:equatable/equatable.dart';

class PrandModel extends Equatable {
  final int brandId;
  final String name;
  final bool isActive;

  const PrandModel({
    required this.brandId,
    required this.name,
    required this.isActive,
  });

  @override
  List<Object?> get props => [brandId, name, isActive];
}
