import 'package:graph_sample/domain/entity/blood_glucose_graph_entity.dart';
import 'package:graph_sample/presentation/enum/graph_section_type.dart';
import 'package:graph_sample/presentation/view_data/graph_point.dart';
import 'package:graph_sample/presentation/view_data/graph_section.dart';
import 'package:graph_sample/presentation/view_data/graph_target_band.dart';

class GraphViewData {
  final List<GraphSection> sections;

  const GraphViewData(this.sections);

  static GraphViewData fromBloodGlucoseGraphEntity(BloodGlucoseGraphEntity entity, GraphTargetBand band) {
    final points = entity.points.map((point) => GraphPoint.fromBloodGlucoseGraphPointEntity(point)).toList();

    /// Gradient의 방향등을 type으로 지정해줌
    List<GraphSection> sections = [];
    List<GraphPoint> currentSectionPoints = [];
    GraphSectionType currentSectionType;

    if (points.isNotEmpty) {
      currentSectionType = _getGraphSectionType(
        points[0].y.toInt(),
        points[0].y.toInt(),
        band.minGraphStartTarget.toInt(),
        band.minGraphEndTarget.toInt(),
        band.maxGraphStartTarget.toInt(),
        band.maxGraphEndTarget.toInt(),
      );
      for (int i = 0; i < points.length - 1; i++) {
        final currentPoint = points[i];
        final nextPoint = points[i + 1];

        final GraphSectionType sectionType;
        if (currentPoint.y == nextPoint.y) {
          sectionType = currentSectionType;
        } else {
          sectionType = _getGraphSectionType(
            currentPoint.y.toInt(),
            nextPoint.y.toInt(),
            band.minGraphStartTarget.toInt(),
            band.minGraphEndTarget.toInt(),
            band.maxGraphStartTarget.toInt(),
            band.maxGraphEndTarget.toInt(),
          );
        }

        if (sectionType != currentSectionType && currentSectionPoints.isNotEmpty) {
          currentSectionPoints.add(currentPoint);
          sections.add(GraphSection(points: List.from(currentSectionPoints), type: currentSectionType));
          currentSectionPoints.clear();
          currentSectionType = sectionType;
        }

        currentSectionPoints.add(currentPoint);
      }

      currentSectionPoints.add(points.last);
      sections.add(GraphSection(points: List.from(currentSectionPoints), type: currentSectionType));
    }
    return GraphViewData(sections);
  }

  static GraphSectionType _getGraphSectionType(
    int currY,
    int nextY,
    int lowerRangeStart,
    int lowerRangeEnd,
    int upperRangeStart,
    int upperRangeEnd,
  ) {
    if (nextY < lowerRangeStart) {
      return GraphSectionType.belowTarget;
    } else if (nextY > upperRangeEnd) {
      return GraphSectionType.aboveTarget;
    } else if (nextY >= lowerRangeStart && nextY <= lowerRangeEnd) {
      if (currY < nextY) {
        return GraphSectionType.belowToTarget;
      } else {
        return GraphSectionType.targetToBelow;
      }
    } else if (nextY >= upperRangeStart && nextY <= upperRangeEnd) {
      if (currY < nextY) {
        return GraphSectionType.targetToAbove;
      } else {
        return GraphSectionType.aboveToTarget;
      }
    } else {
      return GraphSectionType.target;
    }
  }
}
