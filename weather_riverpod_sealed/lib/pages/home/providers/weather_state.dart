import 'package:weather_riverpod_asyncvalue/models/current_weather/current_weather.dart';

import '../../../models/custom_error/custom_error.dart';

sealed class WeatherState {
  const WeatherState();
}

final class WeatherStateInitial extends WeatherState {
  const WeatherStateInitial();

  @override
  String toString() => 'WeatherStateInitial()';
}

final class WeatherStateLoading extends WeatherState {
  const WeatherStateLoading();

  @override
  String toString() => 'WeatherStateLoading()';
}

final class WeatherStateSuccess extends WeatherState {
  final CurrentWeather currentWeather;
  const WeatherStateSuccess({required this.currentWeather});

  @override
  String toString() => 'WeatherStateSuccess()';
}

final class WeatherStateFailure extends WeatherState {
  final CustomError error;
  const WeatherStateFailure({
    required this.error,
  });

  @override
  String toString() => 'WeatherStateFailure($error)';
}
