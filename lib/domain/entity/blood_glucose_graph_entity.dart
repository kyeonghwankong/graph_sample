import 'package:flutter/foundation.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_point_entity.dart';

@immutable
class BloodGlucoseGraphEntity {
  final List<BloodGlucoseGraphPointEntity> points;

  const BloodGlucoseGraphEntity(this.points);
}
