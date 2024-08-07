// import 'package:flutter_riverpod/xflutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

// final helloProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[helloProvider] disposed');
//   });
//   return 'hello';
// });

// final worldProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[worldProvider] disposed');
//   });
//   return 'world';
// });

@Riverpod(keepAlive: true)
String hello(HelloRef ref) {
  ref.onDispose(() {
    print('[helloProvider] disposed');
  });
  return 'hello';
}

@riverpod
String world(WorldRef ref) {
  ref.onDispose(() {
    print('[worldProvider] disposed');
  });
  return 'World';
}
