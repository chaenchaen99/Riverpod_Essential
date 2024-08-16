import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_asyncvalue/pages/temp_settings/providers/temp_setting_state.dart';
import 'package:weather_riverpod_asyncvalue/pages/temp_settings/providers/temp_settings_provider.dart';

class ShowTemperature extends ConsumerWidget {
  const ShowTemperature({
    super.key,
    required this.temperature,
    required this.fontSize,
    this.fontweight = FontWeight.normal,
  });
  final double temperature;
  final double fontSize;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempUnit = ref.watch(tempSettingsProvider);
    final currentTemperature = switch (tempUnit) {
      Celsius() =>
        '${temperature.toStringAsFixed(2)}\u2103', //\u2103는 유니코드 문자로, 섭씨 온도 기호 ℃를 나타낸다.
      Fahrenheit() =>
        '${((temperature * 9 / 5) + 32).toStringAsFixed(2)}\u2109',
    };

    return Text(
      currentTemperature,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
    );
  }
}
