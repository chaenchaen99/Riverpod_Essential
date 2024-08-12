import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//StreamProvider는 비동기 스트림을 제공하는 리버팟의 프로바이더이다.
//take(60) => 스트림의 앞에서부터 60개의 이벤트만을 가져온다.
// final tickerProvider = StreamProvider<int>((ref) {
//   ref.onDispose(() {
//     print('[tickerProvider] disposed');
//   });
//   return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(60);
// });

part 'ticker_provider.g.dart';

@riverpod
Stream<int> ticker(TickerRef ref) {
  ref.onDispose(() {
    print('[tickerProvider] disposed');
  });
  return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(60);
}
