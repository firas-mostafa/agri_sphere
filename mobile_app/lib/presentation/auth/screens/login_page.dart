import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/image/image_helper.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/logic/user_cubit/user_cubit.dart';
import 'package:mobile_app/presentation/auth/logic/obscure/obscure_cubit.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custom_dialog.dart';
import 'package:mobile_app/widgets/custom_text_button.dart';
import 'package:mobile_app/widgets/custom_text_field.dart';
import 'package:mobile_app/widgets/svg_icon.dart';
import 'package:mobile_app/widgets/theme_switcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (consumerContext, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
              icon: ImageHelper.smile,
              backgroundColor: context.colorScheme.primaryContainer,
              text: "Login Success",
              textColor: context.colorScheme.onPrimaryContainer,
            ),
          );
        } else if (state is SignInFailure) {
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
                    SizedBox(height: context.setHeight(150)),
                    Text(
                      "hello_again_!".tr(context),
                      style: context.textTheme.headlineLarge!.copyWith(
                        color: context.colorScheme.tertiary,
                      ),
                    ),
                    //Email Field
                    SizedBox(height: context.setHeight(20)),
                    CustomTextField(
                      controller: consumerContext
                          .watch<UserCubit>()
                          .signInEmail,
                      text: "email".tr(context),
                      textInputAction: TextInputAction.next,
                      focusNode: consumerContext
                          .read<UserCubit>()
                          .signInEmailFocuseNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(
                          consumerContext
                              .read<UserCubit>()
                              .signInPasswordFocuseNode,
                        );
                      },
                    ),
                    //password field
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
                            controller: consumerContext
                                .watch<UserCubit>()
                                .signInPassword,
                            text: 'password'.tr(context),
                            obscure: obscure,
                            focusNode: consumerContext
                                .read<UserCubit>()
                                .signInPasswordFocuseNode,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              consumerContext.read<UserCubit>().signIn();
                            },
                            suffix: IconButton(
                              icon: SvgIcon(
                                obscure ? ImageHelper.eye : ImageHelper.eyeOff,
                              ),
                              onPressed: obscureContext
                                  .read<ObscureCubit>()
                                  .obscureChange,
                            ),
                          );
                        },
                      ),
                    ),
                    //Forget Password ?
                    SizedBox(height: context.setHeight(14)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/forget_password',
                            );
                          },
                          text: "forget_password?".tr(context),
                        ),
                      ],
                    ),
                    SizedBox(height: context.setHeight(100)),
                    //Login button
                    state is SignInLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            text: "login".tr(context),
                            onTap: consumerContext.read<UserCubit>().signIn,
                          ),

                    //not a member ? Register Now
                    SizedBox(height: context.screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "dont_have_account?".tr(context),
                          style: context.textTheme.titleMedium,
                        ),
                        CustomTextButton(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          text: 'register'.tr(context),
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
