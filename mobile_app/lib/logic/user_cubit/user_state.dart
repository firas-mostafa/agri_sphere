part of 'user_cubit.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

// SignIn
final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errorMessage;
  SignInFailure(this.errorMessage);
}

final class SignInSuccess extends UserState {}

// SignUp
final class SignUpSuccess extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}
