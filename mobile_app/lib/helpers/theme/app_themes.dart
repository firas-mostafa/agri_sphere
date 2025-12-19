import "package:flutter/material.dart"
    show Color, ColorScheme, Brightness, TextTheme, ThemeData;

class AppThemes {
  final TextTheme textTheme;

  const AppThemes(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff456800),
      surfaceTint: Color(0xff456800),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8ac229),
      onPrimaryContainer: Color(0xff314c00),
      secondary: Color(0xff043f09),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff21571f),
      onSecondaryContainer: Color(0xff91cc86),
      tertiary: Color(0xff343e4b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4b5563),
      onTertiaryContainer: Color(0xffbfcada),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff434748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xff9ed83f),
      primaryFixed: Color(0xffb9f559),
      onPrimaryFixed: Color(0xff121f00),
      primaryFixedDim: Color(0xff9ed83f),
      onPrimaryFixedVariant: Color(0xff334f00),
      secondaryFixed: Color(0xffb5f2a9),
      onSecondaryFixed: Color(0xff002202),
      secondaryFixedDim: Color(0xff9ad68f),
      onSecondaryFixedVariant: Color(0xff1b511a),
      tertiaryFixed: Color(0xffd9e3f4),
      onTertiaryFixed: Color(0xff121c28),
      tertiaryFixedDim: Color(0xffbdc7d8),
      onTertiaryFixedVariant: Color(0xff3e4755),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa4df45),
      surfaceTint: Color(0xff9ed83f),
      onPrimary: Color(0xff223600),
      primaryContainer: Color(0xff8ac229),
      onPrimaryContainer: Color(0xff314c00),
      secondary: Color(0xff9ad68f),
      onSecondary: Color(0xff003a05),
      secondaryContainer: Color(0xff21571f),
      onSecondaryContainer: Color(0xff91cc86),
      tertiary: Color(0xffbdc7d8),
      onTertiary: Color(0xff27313e),
      tertiaryContainer: Color(0xff4b5563),
      onTertiaryContainer: Color(0xffbfcada),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c7),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff434748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff456800),
      primaryFixed: Color(0xffb9f559),
      onPrimaryFixed: Color(0xff121f00),
      primaryFixedDim: Color(0xff9ed83f),
      onPrimaryFixedVariant: Color(0xff334f00),
      secondaryFixed: Color(0xffb5f2a9),
      onSecondaryFixed: Color(0xff002202),
      secondaryFixedDim: Color(0xff9ad68f),
      onSecondaryFixedVariant: Color(0xff1b511a),
      tertiaryFixed: Color(0xffd9e3f4),
      onTertiaryFixed: Color(0xff121c28),
      tertiaryFixedDim: Color(0xffbdc7d8),
      onTertiaryFixedVariant: Color(0xff3e4755),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
