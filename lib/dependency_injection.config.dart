// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:graph_sample/data/data_source/data_source.dart' as _i3;
import 'package:graph_sample/data/data_source/mock_data_source.dart' as _i4;
import 'package:graph_sample/data/repository/blood_glucose_repository_impl.dart'
    as _i6;
import 'package:graph_sample/domain/repository/blood_glucose_repository.dart'
    as _i5;
import 'package:graph_sample/domain/use_case/get_blood_glucose_graph_use_case.dart'
    as _i7;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.DataSource>(() => _i4.MockDataSource());
    gh.factory<_i5.BloodGlucoseRepository>(
        () => _i6.BloodGlucoseRepositoryImpl(gh<_i3.DataSource>()));
    gh.factory<_i7.GetBloodGlucoseGraphUseCase>(() =>
        _i7.GetBloodGlucoseGraphUseCase(gh<_i5.BloodGlucoseRepository>()));
    return this;
  }
}
