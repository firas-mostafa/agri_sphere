import 'package:equatable/equatable.dart' show Equatable;
import 'package:mobile_app/core/api/end_ponits.dart';

class UserModel extends Equatable {
  final String email;
  final String image;
  final String username;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final List<dynamic> addresses;
  final String createdAt;

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    String createdAtStr = jsonData[ApiKey.createdAt];
    DateTime dateTime = DateTime.parse(createdAtStr);
    String formattedCreatedAt =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    String imageFromJson = jsonData[ApiKey.image] != ""
        ? jsonData[ApiKey.image]
        : "/uploads/users/small/3-1768441872.png";
    String image = EndPoint.baseUrl + imageFromJson;
    return UserModel(
      email: jsonData[ApiKey.email],
      username: jsonData[ApiKey.username],
      firstName: jsonData[ApiKey.firstName] ?? "user",
      lastName: jsonData[ApiKey.lastName] ?? "",
      phoneNumber: jsonData[ApiKey.phoneNumber] ?? "+963-XXXXXXXXX",
      addresses: jsonData[ApiKey.addresses] ?? [],
      createdAt: formattedCreatedAt,
      image: image,
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
    required this.image,
  });

  @override
  List<Object?> get props => [
    username,
    email,
    firstName,
    lastName,
    phoneNumber,
    addresses,
    createdAt,
  ];
}
