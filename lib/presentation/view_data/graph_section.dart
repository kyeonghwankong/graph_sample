import 'package:graph_sample/presentation/enum/graph_section_type.dart';
import 'package:graph_sample/presentation/view_data/graph_point.dart';

class GraphSection {
  final List<GraphPoint> points;
  final GraphSectionType type;

  const GraphSection({
    required this.points,
    required this.type,
  });
}
