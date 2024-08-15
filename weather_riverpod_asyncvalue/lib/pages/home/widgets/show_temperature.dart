import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShowTemperature extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final currentTemperature = '${temperature.toStringAsFixed(2)}\u2103';
    return Text(
      currentTemperature,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
    );
  }
}
