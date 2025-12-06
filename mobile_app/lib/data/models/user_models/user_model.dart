import 'package:equatable/equatable.dart' show Equatable;
import 'package:mobile_app/core/api/end_ponits.dart';

class UserModel extends Equatable {
  final String email;
  final String name;

  const UserModel({required this.email, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      email: jsonData[ApiKey.email],
      name: jsonData[ApiKey.name],
    );
  }

  @override
  List<Object?> get props => [name, email];
}
