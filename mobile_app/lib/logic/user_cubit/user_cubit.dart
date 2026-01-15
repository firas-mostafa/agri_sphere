import 'package:flutter/material.dart' show TextEditingController, FocusNode;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:mobile_app/data/models/user_models/user_model.dart';
import 'package:mobile_app/data/repositories/user_repository.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  FocusNode signInEmailFocuseNode = FocusNode();
  FocusNode signInPasswordFocuseNode = FocusNode();
  FocusNode signUpEmailFocuseNode = FocusNode();
  FocusNode signUpPasswordFocuseNode = FocusNode();
  FocusNode signUpNameFocuseNode = FocusNode();
  final UserRepository userRepository;

  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  UserCubit(this.userRepository) : super(UserInitial());

  Future<dynamic> signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      signInEmail.text,
      signInPassword.text,
    );
    response.fold(
      (errorMessage) => emit(SignInFailure(errorMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }

  Future<dynamic> signUp() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      signUpEmail.text,
      signUpName.text,
      signUpPassword.text,
    );
    response.fold(
      (errorMessage) => emit(SignUpFailure(errorMessage)),
      (signInModel) => emit(SignUpSuccess()),
    );
  }

  Future<dynamic> getProfileDetails() async {
    emit(GetProfileDetailsLoading());
    final response = await userRepository.getProfileDetails();
    response.fold(
      (errorMessage) => emit(GetProfileDetailsFailure(errorMessage)),
      (userModel) => emit(GetProfileDetailsSuccess(userModel)),
    );
  }

  void logOut() {
    userRepository.logOut();
    emit(UserInitial());
  }
}
