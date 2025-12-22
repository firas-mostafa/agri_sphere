import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/theme/logic/theme_cubit.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

enum _ThemeOption { light, dark, system }

class SettingsThemeSwitcher extends StatefulWidget {
  const SettingsThemeSwitcher({super.key});

  @override
  State<SettingsThemeSwitcher> createState() => _SettingsThemeSwitcherState();
}

class _SettingsThemeSwitcherState extends State<SettingsThemeSwitcher> {
  _ThemeOption _selected = _ThemeOption.system;

  Widget _buildOption(_ThemeOption value, String label) {
    switch (context.watch<ThemeCubit>().state.themeMode) {
      case ThemeMode.light:
        _selected = _ThemeOption.light;
        break;
      case ThemeMode.dark:
        _selected = _ThemeOption.dark;
        break;
      case ThemeMode.system:
        _selected = _ThemeOption.system;
        break;
    }

    final bool selected = _selected == value;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selected = value),
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Radio<_ThemeOption>(
              value: value,
              groupValue: _selected,
              onChanged: (_ThemeOption? v) {
                if (v != null) setState(() => _selected = v);
                switch (_selected) {
                  case _ThemeOption.light:
                    context.read<ThemeCubit>().setLight();
                    throw UnimplementedError();
                  case _ThemeOption.dark:
                    context.read<ThemeCubit>().setDark();

                    throw UnimplementedError();
                  case _ThemeOption.system:
                    context.read<ThemeCubit>().setSystem();

                    throw UnimplementedError();
                }
              },
              activeColor: context.colorScheme.primary,
            ),
            Text(
              label,
              style: context.textTheme.bodySmall!.copyWith(
                color: selected
                    ? context.colorScheme.primary
                    : context.textTheme.bodyMedium?.color,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = context.colorScheme.outline;

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'appearance'.tr(context),
            style: context.textTheme.bodyMedium!.copyWith(fontSize: 13),
          ),
          const SizedBox(height: 6),
          Text(
            'choose_a_light_or_dark_theme'.tr(context),
            style: context.textTheme.bodyMedium!.copyWith(fontSize: 13),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOption(_ThemeOption.light, 'light'.tr(context)),
              _buildOption(_ThemeOption.dark, 'dark'.tr(context)),
              _buildOption(_ThemeOption.system, 'default_system'.tr(context)),
            ],
          ),
        ],
      ),
    );
  }
}
