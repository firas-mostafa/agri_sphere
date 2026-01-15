import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class EditProfile extends StatelessWidget {
  final String username;
  final String phoneNumber;
  final String email;
  final List<String> adresss;

  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.outline),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ListTile(title: username, subtitle: user)],
      ),
    );
  }
}
