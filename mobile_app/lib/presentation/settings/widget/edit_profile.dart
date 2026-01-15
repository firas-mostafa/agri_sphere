import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class EditProfile extends StatelessWidget {
  final String username;
  final String phoneNumber;
  final String email;
  final List<String> adresss;
  final VoidCallback? onEdit;

  const EditProfile({
    super.key,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.adresss,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = context.colorScheme.outline;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      padding: EdgeInsets.all(context.setMineSize(14)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'profile'.tr(context),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'your_profile_information'.tr(context),
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 13),
              ),
              SizedBox(height: context.setHeight(12)),
              RichText(
                text: TextSpan(
                  text: '${'username'.tr(context)}: ',
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: username,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${'phone_number'.tr(context)}: ',
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: phoneNumber,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${'email'.tr(context)}: ',
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: email,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   'addresses'.tr(context) + ': ${adresss.join(', ')}',
              //   style: context.textTheme.bodyMedium,
              // ),
            ],
          ),
          Positioned(
            top: -8,
            right: -8,
            child: IconButton(
              icon: CircleAvatar(
                backgroundColor: context.colorScheme.surfaceContainer,
                child: Icon(
                  Icons.edit,
                  size: context.setMineSize(24),
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              onPressed: onEdit,
            ),
          ),
        ],
      ),
    );
  }
}
