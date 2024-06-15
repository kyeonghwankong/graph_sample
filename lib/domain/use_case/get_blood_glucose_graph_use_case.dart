import 'package:graph_sample/common/domain/use_case.dart';
import 'package:graph_sample/dependency_injection.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_entity.dart';
import 'package:graph_sample/domain/repository/blood_glucose_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetBloodGlucoseGraphUseCase implements UseCase<Future<BloodGlucoseGraphEntity>, void> {
  final BloodGlucoseRepository _repository;

  GetBloodGlucoseGraphUseCase([BloodGlucoseRepository? repository]) : _repository = repository ?? inject();

  @override
  Future<BloodGlucoseGraphEntity> execute([void param]) {
    return _repository.getBloodGlucoseGraphEntity();
  }
}
