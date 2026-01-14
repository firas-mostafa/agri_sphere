part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  List<Object?> get props => [weather];
}

class WeathertError extends WeatherState {
  final String message;
  const WeathertError(this.message);

  @override
  List<Object?> get props => [message];
}
