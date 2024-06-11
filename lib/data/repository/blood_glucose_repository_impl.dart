import 'package:graph_sample/data/data_source/data_source.dart';
import 'package:graph_sample/dependency_injection.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_entity.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_point_entity.dart';
import 'package:graph_sample/domain/repository/blood_glucose_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BloodGlucoseRepository)
class BloodGlucoseRepositoryImpl implements BloodGlucoseRepository {
  final DataSource _dataSource;

  BloodGlucoseRepositoryImpl([DataSource? dataSource]) : _dataSource = dataSource ?? inject();

  @override
  Future<BloodGlucoseGraphEntity> getBloodGlucoseGraphEntity() async {
    try {
      final model = await _dataSource.getBloodGlucoseGraph();
      final data = model.data;

      if (data != null) {
        data.points.map((point) {
          return BloodGlucoseGraphPointEntity(x: point.x, y: point.y, dateTime: point.dateTime!);
        });
      }
    } catch (e, s) {
      return Future.error(e, s);
    }

    return Future.error(Error());
  }
}
