// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:money_manager/data/repositories/user_repository.dart' as _i957;
import 'package:money_manager/data/repositories/user_repository_local.dart'
    as _i600;
import 'package:money_manager/data/services/database_service.dart' as _i450;
import 'package:money_manager/ui/login/bloc/login_bloc.dart' as _i51;
import 'package:money_manager/ui/sign_up/bloc/sign_up_bloc.dart' as _i446;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i450.DataBaseService>(() => _i450.DataBaseService());
    gh.factory<_i957.UserRepository>(
      () => _i600.UserRepositoryLocal(
        dataBaseService: gh<_i450.DataBaseService>(),
      ),
    );
    gh.factory<_i51.LoginBloc>(
      () => _i51.LoginBloc(userRepository: gh<_i957.UserRepository>()),
    );
    gh.factory<_i446.SignUpBloc>(
      () => _i446.SignUpBloc(userRepository: gh<_i957.UserRepository>()),
    );
    return this;
  }
}
