import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:graph_sample/common/util/date_time_util.dart';
import 'package:graph_sample/presentation/enum/graph_section_type.dart';
import 'package:graph_sample/presentation/view/zoomable_graph_view.dart';
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
    return ZoomableGraphView(
      minX: widget.graphViewData.sections.first.points.first.x,
      maxX: widget.graphViewData.sections.last.points.last.x,
      builder: (minX, maxX) {
        return AspectRatio(
          aspectRatio: 1,
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 30,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      if (value % 10 == 0) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(color: Colors.black, fontSize: 12),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      final avg = (meta.min + meta.max / 2).toInt();
                      if (value == avg || meta.min.ceilToDouble() == value || meta.max.floorToDouble() == value) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            convertMinutesToHoursAndMinutes(value.toInt()),
                            style: const TextStyle(color: Colors.black, fontSize: 8),
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                ),
              ),
              maxX: maxX,
              minX: minX,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 30,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(color: Color(0xFFC4C8CE), strokeWidth: 1);
                },
              ),
              clipData: const FlClipData.all(),
              lineTouchData: const LineTouchData(enabled: false),
              rangeAnnotations: RangeAnnotations(
                horizontalRangeAnnotations: [
                  HorizontalRangeAnnotation(
                    y1: widget.targetBand.minTargetBand,
                    y2: widget.targetBand.maxTargetBand,
                    color: widget.targetGraphColor.withOpacity(0.2),
                  ),
                ],
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  bottom: BorderSide(color: Color(0xFFC4C8CE), width: 1), // Bottom padding
                ),
              ),
              lineBarsData: widget.graphViewData.sections.map((section) {
                return LineChartBarData(
                  spots: section.points.map((point) => FlSpot(point.x, point.y)).toList(),
                  barWidth: 4,
                  dotData: const FlDotData(show: false),
                  // showingIndicators: _getShowingIndicators(section),
                  gradient: _getGradient(section, widget.targetBand),
                  color: _getColor(section.type),
                  aboveBarData: BarAreaData(
                    cutOffY: widget.targetBand.minTargetBand,
                    applyCutOffY: true,
                    show: section.type.isBelowToTarget || section.type.isTargetToBelow || section.type.isBelowTarget,
                    color: widget.targetUnderGraphColor.withOpacity(0.2),
                    // gradient: LinearGradient(
                    //   colors: [widget.targetUnderGraphColor.withOpacity(0.2), Colors.white],
                    //   stops: const [0.01, 0.01],
                    //   begin: Alignment.bottomCenter,
                    //   end: Alignment.topCenter,
                    // ),
                  ),
                  belowBarData: BarAreaData(
                    show: section.type.isAboveToTarget || section.type.isTargetToAbove || section.type.isAboveTarget,
                    cutOffY: widget.targetBand.maxTargetBand,
                    applyCutOffY: true,
                    color: widget.targetOverGraphColor.withOpacity(0.2),
                    // gradient: LinearGradient(
                    //   colors: [widget.targetOverGraphColor.withOpacity(0.2), Colors.white],
                    //   stops: const [0.01, 0.01],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
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
    // 타겟 밴드를 오갈 때 Gradient 색상 설정
    final minGraphStartTarget = widget.targetBand.minTargetBand.toInt() - widget.targetBand.interpolationValue.toInt();
    final minGraphEndTarget = widget.targetBand.minTargetBand.toInt() + widget.targetBand.interpolationValue.toInt();
    final maxGraphStartTarget = widget.targetBand.maxTargetBand.toInt() - widget.targetBand.interpolationValue.toInt();
    final maxGraphEndTarget = widget.targetBand.maxTargetBand.toInt() + widget.targetBand.interpolationValue.toInt();

    if (isStart) {
      if (type == GraphSectionType.belowToTarget || type == GraphSectionType.targetToAbove) {
        if (y < minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= minGraphStartTarget && y <= minGraphEndTarget) {
          return Color.lerp(widget.targetUnderGraphColor, widget.targetGraphColor,
              (y - minGraphStartTarget) / (minGraphEndTarget - minGraphStartTarget))!;
        } else if (y >= maxGraphStartTarget && y <= maxGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetOverGraphColor,
              (y - maxGraphStartTarget) / (maxGraphEndTarget - maxGraphStartTarget))!;
        } else {
          return widget.targetGraphColor;
        }
      } else {
        if (y < minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= minGraphStartTarget && y <= minGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetUnderGraphColor,
              (y - minGraphEndTarget) / (minGraphStartTarget - minGraphEndTarget))!;
        } else if (y >= maxGraphStartTarget && y <= maxGraphEndTarget) {
          return Color.lerp(widget.targetOverGraphColor, widget.targetGraphColor,
              (y - maxGraphEndTarget) / (maxGraphStartTarget - maxGraphEndTarget))!;
        } else {
          return widget.targetGraphColor;
        }
      }
    } else {
      if (type == GraphSectionType.belowToTarget || type == GraphSectionType.targetToAbove) {
        if (y < minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= minGraphStartTarget && y <= minGraphEndTarget) {
          return Color.lerp(widget.targetUnderGraphColor, widget.targetGraphColor,
              (y - minGraphStartTarget) / (minGraphEndTarget - minGraphStartTarget))!;
        } else if (y >= maxGraphStartTarget && y <= maxGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetOverGraphColor,
              (y - maxGraphStartTarget) / (maxGraphEndTarget - maxGraphStartTarget))!;
        } else {
          return widget.targetGraphColor;
        }
      } else {
        if (y < minGraphStartTarget) {
          return widget.targetUnderGraphColor;
        } else if (y > maxGraphEndTarget) {
          return widget.targetOverGraphColor;
        } else if (y >= minGraphStartTarget && y <= minGraphEndTarget) {
          return Color.lerp(widget.targetGraphColor, widget.targetUnderGraphColor,
              (y - minGraphEndTarget) / (minGraphStartTarget - minGraphEndTarget))!;
        } else if (y >= maxGraphStartTarget && y <= maxGraphEndTarget) {
          return Color.lerp(widget.targetOverGraphColor, widget.targetGraphColor,
              (y - maxGraphEndTarget) / (maxGraphStartTarget - maxGraphEndTarget))!;
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
