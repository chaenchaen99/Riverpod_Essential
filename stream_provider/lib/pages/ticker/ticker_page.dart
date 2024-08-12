import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_provider/pages/ticker/ticker_provider.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  String zeroPaddedTwoDigits(double ticks) {
    return ticks.floor().toString().padLeft(2, '0');
    //padLeft: 변환된 문자열이 길이가 2보다 작을 경우, 왼쪽에 '0'을 추가하여 길이가 2가 되도록 만든다.
  }

  String formatTimer(int ticks) {
    final minutes = zeroPaddedTwoDigits((ticks / 60) % 60);
    final seconds = zeroPaddedTwoDigits(ticks % 60);
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);
    print(tickerValue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticker'),
      ),
      body: Center(
        child: tickerValue.when(
            data: (ticks) => Text(
                  formatTimer(ticks),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
            error: (e, st) => Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
