import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graph_sample/common/presentation/view_status.dart';

part 'blood_glucose_graph_bloc_state.freezed.dart';

@freezed
class BloodGlucoseGraphBlocState with _$BloodGlucoseGraphBlocState {
  const factory BloodGlucoseGraphBlocState({
    @Default(ViewStatus.initial) ViewStatus viewStatus,
  }) = _BloodGlucoseGraphBlocState;
}
