import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_sample/common/presentation/view_status.dart';
import 'package:graph_sample/dependency_injection.dart';
import 'package:graph_sample/domain/use_case/get_blood_glucose_graph_use_case.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc_event.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc_state.dart';
import 'package:graph_sample/presentation/view_data/graph_view_data.dart';

class BloodGlucoseGraphBloc extends Bloc<BloodGlucoseBlocEvent, BloodGlucoseGraphBlocState> {
  final GetBloodGlucoseGraphUseCase _useCase;

  BloodGlucoseGraphBloc([GetBloodGlucoseGraphUseCase? useCase])
      : _useCase = useCase ?? inject(),
        super(const BloodGlucoseGraphBlocState()) {
    on<OnInitBloodGlucoseGraphPage>(_onInitBloodGlucoseGraphPage);
    add(OnInitBloodGlucoseGraphPage());
  }

  FutureOr<void> _onInitBloodGlucoseGraphPage(
    OnInitBloodGlucoseGraphPage event,
    Emitter<BloodGlucoseGraphBlocState> emit,
  ) async {
    if (state.viewStatus.isLoading) {
      return;
    }

    emit(state.asLoading());

    try {
      final entity = await _useCase.execute();

      if (entity.points.isNotEmpty) {
        emit(state.asSuccess().saveGraphViewData(GraphViewData.fromBloodGlucoseGraphEntity(entity, state.targetBand)));
      } else {
        emit(state.asEmpty());
      }
    } catch (e, s) {
      emit(state.asFailure());
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
  }
}
