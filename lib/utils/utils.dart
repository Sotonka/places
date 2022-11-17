import 'dart:math';
import 'package:places/domain/coordinates.dart';

class Utils {
  Utils();

  bool arePointsNear({
    required Coord checkPoint,
    required Coord centerPoint,
    required double km,
  }) {
    const ky = 40000 / 360;
    final kx = cos(pi * centerPoint.lat / 180.0) * ky;
    final dx = (centerPoint.lon - checkPoint.lon).abs() * kx;
    final dy = (centerPoint.lat - checkPoint.lat).abs() * ky;

    return sqrt(dx * dx + dy * dy) <= km;
  }
}

class Range<T> {
  final T start;
  final T end;
  const Range(this.start, this.end);

  @override
  String toString() => '[$start .. $end]';
}
