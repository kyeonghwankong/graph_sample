import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_sample/common/presentation/empty_view.dart';
import 'package:graph_sample/common/presentation/failure_view.dart';
import 'package:graph_sample/common/presentation/loading_view.dart';
import 'package:graph_sample/common/presentation/view_status.dart';
import 'package:graph_sample/dependency_injection.config.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc.dart';
import 'package:graph_sample/presentation/bloc/blood_glucose_graph_bloc_state.dart';

class BloodGlucoseGraphPage extends StatelessWidget {
  const BloodGlucoseGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BloodGlucoseGraphBloc(),
      child: const _BloodGlucoseGraphView(),
    );
  }
}

class _BloodGlucoseGraphView extends StatefulWidget {
  const _BloodGlucoseGraphView();

  @override
  State<_BloodGlucoseGraphView> createState() => _BloodGlucoseGraphViewState();
}

class _BloodGlucoseGraphViewState extends State<_BloodGlucoseGraphView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BloodGlucoseGraphBloc, BloodGlucoseGraphBlocState>(
        buildWhen: (prev, curr) => prev.viewStatus != curr.viewStatus,
        builder: (context, state) {
          switch (state.viewStatus) {
            case ViewStatus.initial:
              return const SizedBox.shrink();
            case ViewStatus.loading:
              return const LoadingView();
            case ViewStatus.empty:
              return const EmptyView();
            case ViewStatus.failure:
              return const FailureView();
            case ViewStatus.success:
              return const Center(
                child: Text('sample'),
              );
          }
        },
      ),
    );
  }
}
