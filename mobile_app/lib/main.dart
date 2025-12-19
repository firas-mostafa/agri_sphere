import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_app/core/api/dio_consumer.dart';
import 'package:mobile_app/data/repositories/user_repository.dart';
import 'package:mobile_app/helpers/cache/cache_helper.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/responsive/size_provider.dart';
import 'package:mobile_app/helpers/routes/app_router.dart';
import 'package:mobile_app/helpers/theme/app_themes.dart';
import 'package:mobile_app/helpers/theme/logic/theme_cubit.dart';
import 'package:mobile_app/helpers/theme/text_theme.dart';
import 'package:mobile_app/logic/user_cubit/user_cubit.dart';
import 'package:mobile_app/presentation/splash/splash_screen.dart';
import 'helpers/localization/app_localizations.dart';
import 'helpers/localization/logic/localization_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(cacheHelper: CacheHelper()),
        ),
        BlocProvider<UserCubit>(
          create: (context) =>
              UserCubit(UserRepository(DioConsumer(dio: Dio()))),
        ),
        BlocProvider(create: (context) => LocaleCubit()..getSavedLanguage()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: Size(469, 1018),
      width: context.screenWidth,
      hight: context.screenHeight,
      child: Builder(
        builder: (iContext) {
          TextTheme textTheme = createTextTheme(iContext, "Roboto", "Inter");
          return MaterialApp(
            themeMode: iContext.watch<ThemeCubit>().state.themeMode,
            darkTheme: AppThemes(textTheme).dark(),
            theme: AppThemes(textTheme).light(),
            themeAnimationCurve: Curves.easeInOut,
            themeAnimationDuration: Duration(milliseconds: 300),
            onGenerateRoute: AppRouter().onGenerateRoute,
            locale: iContext.watch<LocaleCubit>().state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
