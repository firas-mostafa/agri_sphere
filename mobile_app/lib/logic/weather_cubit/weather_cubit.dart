import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherFactory _wf;

  WeatherCubit(String apiKey, Locale locale)
    : _wf = WeatherFactory(
        apiKey,
        language: locale == Locale("ar") ? Language.ARABIC : Language.ENGLISH,
      ),
      super(WeatherInitial());

  Future<void> fetchByLocation({
    required double latitude,
    required double longitude,
  }) async {
    emit(WeatherLoading());
    try {
      final weather = await _wf.currentWeatherByLocation(latitude, longitude);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeathertError(e.toString()));
    }
  }

  Future<void> fetchByCityName(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await _wf.currentWeatherByCityName(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeathertError(e.toString()));
    }
  }
}
