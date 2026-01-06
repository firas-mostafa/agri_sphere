import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/image/image_helper.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/logic/user_cubit/user_cubit.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custom_dialog.dart';
import 'package:mobile_app/widgets/custom_text_button.dart';
import 'package:mobile_app/widgets/custom_text_field.dart';
import 'package:mobile_app/widgets/theme_switcher.dart';
import '../logic/obscure/obscure_cubit.dart' show ObscureCubit;

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (consumerContext, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
              icon: ImageHelper.smile,
              backgroundColor: context.colorScheme.primaryContainer,
              text: "Create Account Success",
              textColor: context.colorScheme.onPrimaryContainer,
            ),
          );
        } else if (state is SignUpFailure) {
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
              icon: ImageHelper.frown,
              backgroundColor: context.colorScheme.errorContainer,
              text: state.errorMessage,
              textColor: context.colorScheme.onErrorContainer,
            ),
          );
        }
      },
      builder: (consumerContext, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [ThemeSwitcher()],
              automaticallyImplyLeading: false,
            ),

            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: context.setHeight(100)),

                    Text(
                      "register".tr(context),
                      style: context.textTheme.headlineLarge!.copyWith(
                        color: context.colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(height: context.setHeight(20)),

                    SizedBox(height: context.setHeight(20)),
                    CustomTextField(
                      controller: consumerContext.read<UserCubit>().signUpName,
                      textInputAction: TextInputAction.next,
                      focusNode: consumerContext
                          .read<UserCubit>()
                          .signUpNameFocuseNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(
                          consumerContext
                              .read<UserCubit>()
                              .signUpEmailFocuseNode,
                        );
                      },
                      text: "name".tr(context),
                    ),
                    SizedBox(height: context.setHeight(20)),
                    CustomTextField(
                      controller: consumerContext.read<UserCubit>().signUpEmail,
                      text: "email".tr(context),
                      textInputAction: TextInputAction.next,
                      focusNode: consumerContext
                          .read<UserCubit>()
                          .signUpEmailFocuseNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(
                          consumerContext
                              .read<UserCubit>()
                              .signUpPasswordFocuseNode,
                        );
                      },
                    ),
                    SizedBox(height: context.setHeight(20)),
                    BlocProvider<ObscureCubit>(
                      create: (context) => ObscureCubit(),
                      child: Builder(
                        builder: (obscureContext) {
                          bool obscure = obscureContext
                              .watch<ObscureCubit>()
                              .state
                              .obscure;
                          return CustomTextField(
                            focusNode: consumerContext
                                .read<UserCubit>()
                                .signUpPasswordFocuseNode,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              if (state is! SignUpLoading) {
                                consumerContext.read<UserCubit>().signUp();
                              }
                            },
                            controller: consumerContext
                                .read<UserCubit>()
                                .signUpPassword,
                            text: 'password'.tr(context),
                            obscure: obscure,

                            suffix: IconButton(
                              icon: Icon(
                                obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: obscureContext
                                  .read<ObscureCubit>()
                                  .obscureChange,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.02),
                    SizedBox(height: context.setHeight(100)),

                    state is SignUpLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            text: "register".tr(context),
                            onTap: consumerContext.read<UserCubit>().signUp,
                          ),

                    SizedBox(height: context.screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You_already_have_an_account?".tr(context),
                          style: context.textTheme.titleMedium,
                        ),
                        CustomTextButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          text: 'login'.tr(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
