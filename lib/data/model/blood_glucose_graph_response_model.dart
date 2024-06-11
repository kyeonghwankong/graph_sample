import 'package:flutter/widgets.dart';
import 'package:graph_sample/common/util/date_time_util.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/blood_glucose_graph_response_model.g.dart';

@immutable
@JsonSerializable()
class BloodGlucoseGraphModel {
  final List<BloodGlucoseGraphPointModel> points;

  const BloodGlucoseGraphModel(this.points);

  factory BloodGlucoseGraphModel.fromJson(Map<String, dynamic> json) => _$BloodGlucoseGraphModelFromJson(json);

  Map<String, dynamic> toJson() => _$BloodGlucoseGraphModelToJson(this);
}

@immutable
@JsonSerializable()
class BloodGlucoseGraphPointModel {
  final int x;
  final int y;

  @JsonKey(name: 'dt', fromJson: parseDateTime)
  final DateTime? dateTime;

  const BloodGlucoseGraphPointModel({
    this.x = 0,
    this.y = 0,
    required this.dateTime,
  });

  factory BloodGlucoseGraphPointModel.fromJson(Map<String, dynamic> json) =>
      _$BloodGlucoseGraphPointModelFromJson(json);

  Map<String, dynamic> toJson() => _$BloodGlucoseGraphPointModelToJson(this);
}
