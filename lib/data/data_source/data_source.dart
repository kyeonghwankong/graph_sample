import 'package:graph_sample/common/data/response_model.dart';
import 'package:graph_sample/data/model/blood_glucose_graph_response_model.dart';

abstract interface class DataSource {
  Future<ResponseModel<BloodGlucoseGraphModel>> getBloodGlucoseGraph();
}
