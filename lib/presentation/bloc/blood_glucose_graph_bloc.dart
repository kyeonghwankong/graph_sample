import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc_event.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc_state.dart';

class BloodGlucoseGraphBloc extends Bloc<BloodGlucoseBlocEvent, BloodGlucoseGraphBlocState> {
  BloodGlucoseGraphBloc(super.initialState){
    emit(state);
  }
}
