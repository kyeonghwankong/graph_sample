import 'package:graph_sample/domain/entity/blood_glucose_graph_entity.dart';

abstract interface class BloodGlucoseRepository {
  Future<BloodGlucoseGraphEntity> getBloodGlucoseGraphEntity();
}
