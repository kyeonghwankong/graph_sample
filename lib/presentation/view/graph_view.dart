import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:graph_sample/presentation/enum/graph_section_type.dart';
import 'package:graph_sample/presentation/view_data/graph_point.dart';
import 'package:graph_sample/presentation/view_data/graph_section.dart';
import 'package:graph_sample/presentation/view_data/graph_target_band.dart';
import 'package:graph_sample/presentation/view_data/graph_view_data.dart';

class GraphView extends StatelessWidget {
  static const _defaultGraphColor = Color(0xFF66DDDC);
  static const _defaultOverGraphColor = Color(0xFFFFCD00);
  static const _defaultUnderGraphColor = Color(0xFFFF8DA7);

  final GraphViewData graphViewData;
  final GraphTargetBand targetBand;
  final Function(GraphPoint) onTapPoint;
  final Color targetOverGraphColor;
  final Color targetGraphColor;
  final Color targetUnderGraphColor;

  const GraphView({
    super.key,
    required this.graphViewData,
    required this.targetBand,
    required this.onTapPoint,
    this.targetOverGraphColor = _defaultOverGraphColor,
    this.targetGraphColor = _defaultGraphColor,
    this.targetUnderGraphColor = _defaultUnderGraphColor,
  });

  @override
  Widget build(BuildContext context) {
    return _GraphView(
      graphViewData: graphViewData,
      targetBand: targetBand,
      onTapPoint: onTapPoint,
      targetOverGraphColor: targetOverGraphColor,
      targetGraphColor: targetGraphColor,
      targetUnderGraphColor: targetUnderGraphColor,
    );
  }
}

class _GraphView extends StatefulWidget {
  final GraphViewData graphViewData;
  final GraphTargetBand targetBand;
  final Function(GraphPoint) onTapPoint;
  final Color targetOverGraphColor;
  final Color targetGraphColor;
  final Color targetUnderGraphColor;

  const _GraphView({
    required this.graphViewData,
    required this.targetBand,
    required this.onTapPoint,
    required this.targetOverGraphColor,
    required this.targetGraphColor,
    required this.targetUnderGraphColor,
  });

  @override
  State<_GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<_GraphView> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          lineBarsData: widget.graphViewData.sections.map((section) {
            return LineChartBarData(
              spots: section.points.map((point) => FlSpot(point.x, point.y)).toList(),
              barWidth: 4,
              dotData: const FlDotData(show: false),
              isCurved: true,
              gradient: _getGradient(section, widget.targetBand),
              color: _getColor(section.type),
            );
          }).toList(),
        ),
      ),
    );
  }

  LinearGradient? _getGradient(GraphSection section, GraphTargetBand targetBand) {
    final firstY = section.points.first.y;
    final lastY = section.points.last.y;

    final startColor = _getColorForValue(firstY, targetBand, section.type, true);
    final endColor = _getColorForValue(lastY, targetBand, section.type, false);

    if (section.points.first.y <= section.points.last.y) {
      return LinearGradient(
        colors: [startColor, endColor],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
    } else {
      return LinearGradient(
        colors: [startColor, endColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
  }

  Color _getColorForValue(double y, GraphTargetBand targetBand, GraphSectionType type, bool isStart) {
    if (isStart) {
      if (type == GraphSectionType.belowToTarget || type == GraphSectionType.targetToAbove) {
        if (y < targetBand.minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > targetBand.maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= targetBand.minGraphStartTarget && y <= targetBand.minGraphEndTarget) {
          return Color.lerp(widget.targetUnderGraphColor, widget.targetGraphColor,
              (y - targetBand.minGraphStartTarget) / (targetBand.minGraphEndTarget - targetBand.minGraphStartTarget))!;
        } else if (y >= targetBand.maxGraphStartTarget && y <= targetBand.maxGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetOverGraphColor,
              (y - targetBand.maxGraphStartTarget) / (targetBand.maxGraphEndTarget - targetBand.maxGraphStartTarget))!;
        } else {
          return widget.targetGraphColor;
        }
      } else {
        if (y < targetBand.minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > targetBand.maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= targetBand.minGraphStartTarget && y <= targetBand.minGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetUnderGraphColor,
              (y - targetBand.minGraphEndTarget) / (targetBand.minGraphStartTarget - targetBand.minGraphEndTarget))!;
        } else if (y >= targetBand.maxGraphStartTarget && y <= targetBand.maxGraphEndTarget) {
          return Color.lerp(widget.targetOverGraphColor, widget.targetGraphColor,
              (y - targetBand.maxGraphEndTarget) / (targetBand.maxGraphStartTarget - targetBand.maxGraphEndTarget))!;
        } else {
          return widget.targetGraphColor;
        }
      }
    } else {
      if (type == GraphSectionType.belowToTarget || type == GraphSectionType.targetToAbove) {
        if (y < targetBand.minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > targetBand.maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= targetBand.minGraphStartTarget && y <= targetBand.minGraphEndTarget) {
          return Color.lerp(widget.targetUnderGraphColor, widget.targetGraphColor,
              (y - targetBand.minGraphStartTarget) / (targetBand.minGraphEndTarget - targetBand.minGraphStartTarget))!;
        } else if (y >= targetBand.maxGraphStartTarget && y <= targetBand.maxGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetOverGraphColor,
              (y - targetBand.maxGraphStartTarget) / (targetBand.maxGraphEndTarget - targetBand.maxGraphStartTarget))!;
        } else {
          return widget.targetGraphColor;
        }
      } else {
        if (y < targetBand.minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > targetBand.maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= targetBand.minGraphStartTarget && y <= targetBand.minGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetUnderGraphColor,
              (y - targetBand.minGraphEndTarget) / (targetBand.minGraphStartTarget - targetBand.minGraphEndTarget))!;
        } else if (y >= targetBand.maxGraphStartTarget && y <= targetBand.maxGraphEndTarget) {
          return Color.lerp(widget.targetOverGraphColor, widget.targetGraphColor,
              (y - targetBand.maxGraphEndTarget) / (targetBand.maxGraphStartTarget - targetBand.maxGraphEndTarget))!;
        } else {
          return widget.targetGraphColor;
        }
      }
    }
  }

  Color _getColor(GraphSectionType type) {
    switch (type) {
      case GraphSectionType.belowTarget:
        return widget.targetUnderGraphColor;
      case GraphSectionType.target:
        return widget.targetGraphColor;
      case GraphSectionType.aboveTarget:
        return widget.targetOverGraphColor;
      default:
        return Colors.transparent;
    }
  }
}
