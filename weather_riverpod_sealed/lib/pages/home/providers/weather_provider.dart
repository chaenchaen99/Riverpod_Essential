import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_riverpod_asyncvalue/models/current_weather/current_weather.dart';
import 'package:weather_riverpod_asyncvalue/models/custom_error/custom_error.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/providers/weather_state.dart';
import 'package:weather_riverpod_asyncvalue/repositorys/providers/weather_repository_provider.dart';

part 'weather_provider.g.dart';

@riverpod
class Weather extends _$Weather {
  @override
  WeatherState build() {
    return const WeatherStateInitial();
  }

  Future<void> fetchWeather(String city) async {
    state = const WeatherStateLoading();

    try {
      final CurrentWeather currentWeather =
          await ref.read(weatherRepositoryProvider).fetchWeather(city);

      state = WeatherStateSuccess(currentWeather: currentWeather);
    } on CustomError catch (error) {
      state = WeatherStateFailure(error: error);
    }
  }
}

// @riverpod
// class Weather extends _$Weather {
//   @override
//   FutureOr<CurrentWeather?> build() {
//     return Future<CurrentWeather?>.value(null); //초기값으로 null을 반환하는 간단한 구현
//   }

//   Future<void> fetchWeather(String city) async {
//     state = const AsyncLoading();

//     state = await AsyncValue.guard(() async {
//       final currentWeather =
//           await ref.read(weatherRepositoryProvider).fetchWeather(city);

//       return currentWeather;
//     });
//   }
// }
