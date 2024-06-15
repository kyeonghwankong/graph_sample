import 'package:flutter_test/flutter_test.dart';
import 'package:graph_sample/common/presentation/view_status.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_entity.dart';
import 'package:graph_sample/domain/entity/blood_glucose_graph_point_entity.dart';
import 'package:graph_sample/domain/use_case/get_blood_glucose_graph_use_case.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc_event.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'blood_glucose_graph_bloc_test.mocks.dart';

@GenerateMocks([
  GetBloodGlucoseGraphUseCase,
])
void main() {
  final mockGetBloodGlucoseGraphUseCase = MockGetBloodGlucoseGraphUseCase();

  group('OnInitBloodGlucoseGraphPage test', () {
    blocTest(
      'loading case',
      setUp: () {
        when(mockGetBloodGlucoseGraphUseCase.execute()).thenAnswer((_) async {
          await Future.delayed(const Duration(seconds: 5)); // loading
          return Future.value(
              BloodGlucoseGraphEntity([BloodGlucoseGraphPointEntity(x: 10, y: 10, dateTime: DateTime.now())]));
        });
      },
      build: () => BloodGlucoseGraphBloc(mockGetBloodGlucoseGraphUseCase),
      act: (BloodGlucoseGraphBloc bloc) {
        bloc.add(OnInitBloodGlucoseGraphPage());
        bloc.add(OnInitBloodGlucoseGraphPage());
        bloc.add(OnInitBloodGlucoseGraphPage());
        bloc.add(OnInitBloodGlucoseGraphPage());
        bloc.add(OnInitBloodGlucoseGraphPage());
      },
      verify: (BloodGlucoseGraphBloc bloc) {
        verify(mockGetBloodGlucoseGraphUseCase.execute()).called(1);
        expect(bloc.state.viewStatus.isLoading, true);
      },
    );

    blocTest(
      'success case',
      setUp: () {
        when(mockGetBloodGlucoseGraphUseCase.execute()).thenAnswer((_) => Future.value(
            BloodGlucoseGraphEntity([BloodGlucoseGraphPointEntity(x: 10, y: 10, dateTime: DateTime.now())])));
      },
      build: () => BloodGlucoseGraphBloc(mockGetBloodGlucoseGraphUseCase),
      verify: (BloodGlucoseGraphBloc bloc) {
        verify(mockGetBloodGlucoseGraphUseCase.execute()).called(1);
        expect(bloc.state.viewStatus.isSuccess, true);
      },
    );

    blocTest(
      'empty case',
      setUp: () {
        when(mockGetBloodGlucoseGraphUseCase.execute())
            .thenAnswer((_) => Future.value(const BloodGlucoseGraphEntity([])));
      },
      build: () => BloodGlucoseGraphBloc(mockGetBloodGlucoseGraphUseCase),
      verify: (BloodGlucoseGraphBloc bloc) {
        verify(mockGetBloodGlucoseGraphUseCase.execute()).called(1);
        expect(bloc.state.viewStatus.isEmpty, true);
      },
    );

    blocTest(
      'failure case',
      setUp: () {
        when(mockGetBloodGlucoseGraphUseCase.execute()).thenAnswer((_) => throw Error());
      },
      build: () => BloodGlucoseGraphBloc(mockGetBloodGlucoseGraphUseCase),
      verify: (BloodGlucoseGraphBloc bloc) {
        verify(mockGetBloodGlucoseGraphUseCase.execute()).called(1);
        expect(bloc.state.viewStatus.isFailure, true);
      },
    );
  });
}
