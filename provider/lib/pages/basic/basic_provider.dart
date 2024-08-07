import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[helloProvider] disposed');
  });
  return 'hello';
});

final worldProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[worldProvider] disposed');
  });
  return 'world';
});
