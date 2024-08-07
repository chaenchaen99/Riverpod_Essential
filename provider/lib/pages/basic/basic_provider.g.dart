// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloHash() => r'529a94aa519b51da52c24ace6de368c642dfbaf1';

/// See also [hello].
@ProviderFor(hello)
final helloProvider = Provider<String>.internal(
  hello,
  name: r'helloProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloRef = ProviderRef<String>;
String _$worldHash() => r'ea31e8090a6c08fdfb3fc0153887454119140143';

/// See also [world].
@ProviderFor(world)
final worldProvider = AutoDisposeProvider<String>.internal(
  world,
  name: r'worldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$worldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorldRef = AutoDisposeProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
