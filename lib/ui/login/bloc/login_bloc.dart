import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/data/repositories/user_repository.dart';

import '../../../core/utils/result.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  LoginBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(const LoginState()) {
    on<LoginButtonClicked>(_onLoginButtonClicked);
  }

  Future<void> _onLoginButtonClicked(
    LoginButtonClicked event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final result = await _userRepository.getUser(
      name: event.username,
      password: event.password,
    );
    switch (result) {
      case Ok(:final value):
        emit(state.copyWith(loginStatus: LoginStatus.success, userId: value));
        break;
      case Error():
        emit(state.copyWith(loginStatus: LoginStatus.failure));
    }
  }
}
