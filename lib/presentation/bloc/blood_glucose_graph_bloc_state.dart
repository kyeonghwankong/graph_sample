import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graph_sample/common/presentation/view_status.dart';

part '.generated/blood_glucose_graph_bloc_state.freezed.dart';

@freezed
class BloodGlucoseGraphBlocState with _$BloodGlucoseGraphBlocState {
  const factory BloodGlucoseGraphBlocState({
    @Default(ViewStatus.initial) ViewStatus viewStatus,
  }) = _BloodGlucoseGraphBlocState;

  const BloodGlucoseGraphBlocState._();

  BloodGlucoseGraphBlocState asLoading() {
    return copyWith(viewStatus: ViewStatus.loading);
  }

  BloodGlucoseGraphBlocState asEmpty() {
    return copyWith(viewStatus: ViewStatus.empty);
  }

  BloodGlucoseGraphBlocState asSuccess() {
    return copyWith(viewStatus: ViewStatus.success);
  }

  BloodGlucoseGraphBlocState asFailure() {
    return copyWith(viewStatus: ViewStatus.failure);
  }
}
