import 'package:graph_sample/common/util/date_time_util.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_point_entity.dart';

class GraphPoint {
  final double x;
  final double y;
  final String dateString;
  final bool isSubdivided;

  const GraphPoint({
    required this.x,
    required this.y,
    this.dateString = '',
    this.isSubdivided = false,
  });

  static GraphPoint fromBloodGlucoseGraphPointEntity(BloodGlucoseGraphPointEntity entity) {
    return GraphPoint(
      x: entity.x.toDouble(),
      y: entity.y.toDouble(),
      dateString: formatDateTimeToKoreanTime(entity.dateTime),
    );
  }
}
