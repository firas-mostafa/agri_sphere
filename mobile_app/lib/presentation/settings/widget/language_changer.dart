import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/localization/logic/localization_cubit.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class LanguageChanger extends StatefulWidget {
  const LanguageChanger({super.key});

  @override
  State<LanguageChanger> createState() => _LanguageChangerState();
}

class _LanguageChangerState extends State<LanguageChanger> {
  String _selected = 'English';
  final List<String> _options = ['English', 'العربية'];

  @override
  Widget build(BuildContext context) {
    final borderColor = context.colorScheme.outline;
    switch (context.read<LocaleCubit>().state.locale.languageCode) {
      case 'en':
        _selected = 'English';
        break;
      case 'ar':
        _selected = 'العربية';
        break;
      default:
        _selected = 'English';
    }
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      padding: EdgeInsets.all(context.setMineSize(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'language'.tr(context),
            style: context.textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'choose_your_language'.tr(context),
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 13),
          ),
          SizedBox(height: context.setHeight(12)),
          PopupMenuButton<String>(
            onSelected: (v) {
              setState(() => _selected = v);
              if (v == 'English') {
                context.read<LocaleCubit>().changeLanguage('en');
              } else if (v == 'العربية') {
                context.read<LocaleCubit>().changeLanguage('ar');
              }
            },
            itemBuilder: (context) => _options
                .map(
                  (o) => PopupMenuItem<String>(
                    value: o,
                    child: Text(o, style: context.textTheme.bodyMedium),
                  ),
                )
                .toList(),
            popUpAnimationStyle: AnimationStyle(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 200),
            ),
            position: PopupMenuPosition.under,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.language,
                    size: context.setMineSize(24),
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Text(_selected, style: context.textTheme.bodyMedium),
                  const SizedBox(width: 8),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
