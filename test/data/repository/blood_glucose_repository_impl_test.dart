import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:graph_sample/common/data/response_model.dart';
import 'package:graph_sample/data/data_source/data_source.dart';
import 'package:graph_sample/data/model/blood_glucose_graph_response_model.dart';
import 'package:graph_sample/data/repository/blood_glucose_repository_impl.dart';
import 'package:graph_sample/domain/repository/blood_glucose_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'blood_glucose_repository_impl_test.mocks.dart';

@GenerateMocks([
  DataSource,
])
void main() {
  late BloodGlucoseRepository repository;
  final mockDataSource = MockDataSource();

  setUp(() {
    repository = BloodGlucoseRepositoryImpl(mockDataSource);
  });

  group('happy case', () {
    test('empty points case', () async {
      when(mockDataSource.getBloodGlucoseGraph())
          .thenAnswer((_) => Future.value(const ResponseModel(data: BloodGlucoseGraphModel([]))));
      final entity = await repository.getBloodGlucoseGraphEntity();
      expect(entity.points.isEmpty, true);
    });

    test('not empty points case', () async {
      when(mockDataSource.getBloodGlucoseGraph()).thenAnswer(
          (_) => Future.value(const ResponseModel(data: BloodGlucoseGraphModel([BloodGlucoseGraphPointModel()]))));
      final entity = await repository.getBloodGlucoseGraphEntity();
      expect(entity.points.isNotEmpty, true);
    });
  });

  test('data null case', () {
    when(mockDataSource.getBloodGlucoseGraph()).thenAnswer((_) => Future.value(const ResponseModel(data: null)));

    expect(
      () async => await repository.getBloodGlucoseGraphEntity(),
      throwsA(isA<Error>()),
    );
  });

  test('throw exception case from data source', () {
    when(mockDataSource.getBloodGlucoseGraph()).thenAnswer((_) => throw Error());

    expect(
      () async => await repository.getBloodGlucoseGraphEntity(),
      throwsA(isA<Error>()),
    );
  });
}
