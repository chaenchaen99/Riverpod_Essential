// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherHash() => r'299abbf4f2a777686d36cf1c56fd2b1282cf85b6';

/// See also [Weather].
@ProviderFor(Weather)
final weatherProvider =
    AutoDisposeAsyncNotifierProvider<Weather, CurrentWeather?>.internal(
  Weather.new,
  name: r'weatherProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$weatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Weather = AutoDisposeAsyncNotifier<CurrentWeather?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member