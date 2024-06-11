import 'package:flutter/foundation.dart';

@immutable
class BloodGlucoseGraphPointEntity {
  final int x;
  final int y;
  final DateTime dateTime;

  const BloodGlucoseGraphPointEntity({
    required this.x,
    required this.y,
    required this.dateTime,
  });
}
