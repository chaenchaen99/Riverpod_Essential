import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_asyncvalue/models/current_weather/app_weather.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/widgets/format_text.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/widgets/select_city.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/widgets/show_temperature.dart';
import '../../../models/current_weather/current_weather.dart';
import '../providers/weather_state.dart';
import 'show_icon.dart';

class ShowWeather extends ConsumerStatefulWidget {
  final WeatherState weatherState;
  const ShowWeather({
    super.key,
    required this.weatherState,
  });

  @override
  ConsumerState<ShowWeather> createState() => _ShowWeatherState();
}

class _ShowWeatherState extends ConsumerState<ShowWeather> {
  Widget prevWeatherWidget = const SizedBox.shrink();
  @override
  Widget build(BuildContext context) {
    final weatherState = widget.weatherState;

    switch (weatherState) {
      case WeatherStateInitial():
        return const SelectCity();
      case WeatherStateLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case WeatherStateSuccess(currentWeather: CurrentWeather currentWeather):
        final appWeather = AppWeather.fromCurrentWeather(currentWeather);

        prevWeatherWidget = ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text(
              appWeather.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TimeOfDay.fromDateTime(DateTime.now()).format(context),
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '(${appWeather.country})',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTemperature(
                  temperature: appWeather.temp,
                  fontSize: 30.0,
                  fontweight: FontWeight.bold,
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: [
                    ShowTemperature(
                      temperature: appWeather.tempMax,
                      fontSize: 16.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ShowTemperature(
                      temperature: appWeather.tempMin,
                      fontSize: 16.0,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                ShowIcon(icon: appWeather.icon),
                Expanded(
                  flex: 3,
                  child: FormatText(
                    description: appWeather.description,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        );

        return prevWeatherWidget;

      case WeatherStateFailure(error: _):
        return prevWeatherWidget is SizedBox
            ? const SelectCity()
            : prevWeatherWidget;
    }
  }
}
