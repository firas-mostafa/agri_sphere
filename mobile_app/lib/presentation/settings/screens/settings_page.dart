import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/image/image_helper.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/logic/user_cubit/user_cubit.dart';
import 'package:mobile_app/presentation/settings/widget/edit_profile.dart';
import 'package:mobile_app/presentation/settings/widget/language_changer.dart';
import 'package:mobile_app/presentation/settings/widget/profile_pic.dart';
import 'package:mobile_app/presentation/settings/widget/settings_theme_switcher.dart';
import 'package:mobile_app/widgets/custom_dialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.setMineSize(20),
          vertical: context.setMineSize(50),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: BlocConsumer<UserCubit, UserState>(
                  listener: (_, state) {
                    if (state is GetProfileDetailsFailure) {
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
                  builder: (_, state) {
                    return state is GetProfileDetailsLoading
                        ? CircularProgressIndicator()
                        : state is GetProfileDetailsSuccess
                        ? Column(
                            children: [
                              ProfilePic(state.userModel.image),
                              SizedBox(height: context.setMineSize(10)),
                              Text(
                                "${state.userModel.firstName} ${state.userModel.lastName}",
                                style: context.textTheme.headlineMedium!
                                    .copyWith(
                                      color: context.colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                "${"member_since".tr(context)} ${state.userModel.createdAt}",
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: context.colorScheme.onSurfaceVariant
                                      .withAlpha(180),
                                ),
                              ),
                              Divider(
                                color: context.colorScheme.outlineVariant,
                              ),
                              EditProfile(
                                username: state.userModel.username,
                                phoneNumber: state.userModel.phoneNumber,
                                email: state.userModel.email,
                                adresss: [],
                              ),
                            ],
                          )
                        : SizedBox(child: Text("Something happen"));
                  },
                ),
              ),
              SizedBox(height: context.setMineSize(20)),

              Text(
                'general'.tr(context),
                style: context.textTheme.headlineSmall,
              ),
              SizedBox(height: context.setMineSize(10)),
              SettingsThemeSwitcher(),
              SizedBox(height: context.setMineSize(10)),
              LanguageChanger(),
              SizedBox(height: context.setHeight(100)),
            ],
          ),
        ),
      ),
    );
  }
}
