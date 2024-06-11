// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blood_glucose_graph_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodGlucoseGraphModel _$BloodGlucoseGraphModelFromJson(
        Map<String, dynamic> json) =>
    BloodGlucoseGraphModel(
      (json['points'] as List<dynamic>)
          .map((e) =>
              BloodGlucoseGraphPointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BloodGlucoseGraphModelToJson(
        BloodGlucoseGraphModel instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

BloodGlucoseGraphPointModel _$BloodGlucoseGraphPointModelFromJson(
        Map<String, dynamic> json) =>
    BloodGlucoseGraphPointModel(
      x: (json['x'] as num?)?.toInt() ?? 0,
      y: (json['y'] as num?)?.toInt() ?? 0,
      dateTime: parseDateTime(json['dt'] as String?),
    );

Map<String, dynamic> _$BloodGlucoseGraphPointModelToJson(
        BloodGlucoseGraphPointModel instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'dt': instance.dateTime?.toIso8601String(),
    };
