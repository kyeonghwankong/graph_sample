import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependency_injection.config.dart';

final inject = GetIt.I.get;

@InjectableInit()
void configureDependencies() => GetIt.instance.init();
