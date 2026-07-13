import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/config/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({String env = Environment.dev}) async {
  getIt.init(environment: env);
}
