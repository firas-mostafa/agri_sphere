import 'package:equatable/equatable.dart' show Equatable;
import 'package:mobile_app/core/api/end_ponits.dart';

class SignInModel extends Equatable {
  final String token;
  const SignInModel(this.token);

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(jsonData[ApiKey.token]);
  }

  @override
  List<Object?> get props => [token];
}
