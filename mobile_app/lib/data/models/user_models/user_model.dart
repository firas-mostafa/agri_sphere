import 'package:equatable/equatable.dart' show Equatable;
import 'package:mobile_app/core/api/end_ponits.dart';

class UserModel extends Equatable {
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final int phoneNumber;
  final List<String> addresses;
  final String createdAt;
  final String updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      email: jsonData[ApiKey.email],
      username: jsonData[ApiKey.name],
      firstName: '',
      lastName: '',
      phoneNumber: 1,
      addresses: [''],
      createdAt: '',
      updatedAt: '',
    );
  }

  const UserModel({
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.addresses,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [username, email];
}
