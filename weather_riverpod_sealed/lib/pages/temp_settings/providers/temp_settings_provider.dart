import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_riverpod_asyncvalue/pages/temp_settings/providers/temp_setting_state.dart';

part 'temp_settings_provider.g.dart';

@Riverpod(keepAlive: true)
class TempSettings extends _$TempSettings {
  @override
  TempSettingState build() {
    return const Celsius();
  }

  void toggleTempUnit() {
    state = switch (state) {
      Celsius() => const Fahrenheit(),
      Fahrenheit() => const Celsius(),
    };
  }
}
