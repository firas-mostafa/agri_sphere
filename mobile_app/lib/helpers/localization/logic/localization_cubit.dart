import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/cache/cache_helper.dart';
part 'localization_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        CacheHelper().getDataString('languageCode') ?? 'en';
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    CacheHelper().saveData(key: 'languageCode', value: languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
