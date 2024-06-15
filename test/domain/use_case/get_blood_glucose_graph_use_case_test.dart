import 'package:flutter_test/flutter_test.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_entity.dart';
import 'package:graph_sample/domain/repository/blood_glucose_repository.dart';
import 'package:graph_sample/domain/use_case/get_blood_glucose_graph_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_blood_glucose_graph_use_case_test.mocks.dart';

@GenerateMocks([
  BloodGlucoseRepository,
])
void main() {
  late GetBloodGlucoseGraphUseCase useCase;
  final mockBloodGlucoseRepository = MockBloodGlucoseRepository();

  setUp(() {
    useCase = GetBloodGlucoseGraphUseCase(mockBloodGlucoseRepository);
  });

  group('execute() test', () {
    test('success case', () async {
      when(mockBloodGlucoseRepository.getBloodGlucoseGraphEntity())
          .thenAnswer((_) => Future.value(const BloodGlucoseGraphEntity([])));

      await useCase.execute();
      verify(mockBloodGlucoseRepository.getBloodGlucoseGraphEntity()).called(1);
    });

    test('fail case', () async {
      when(mockBloodGlucoseRepository.getBloodGlucoseGraphEntity()).thenAnswer((_) => throw Error());

      expect(
        () async => await useCase.execute(),
        throwsA(isA<Error>()),
      );

      verify(mockBloodGlucoseRepository.getBloodGlucoseGraphEntity()).called(1);
    });
  });
}
