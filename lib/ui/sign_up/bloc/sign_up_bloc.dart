import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/data/repositories/user_repository.dart';

import '../../../core/utils/result.dart';
import '../../../domain/models/user.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(const SignUpState()) {
    on<SignUpClicked>(_onSignUpClicked);
  }

  Future<void> _onSignUpClicked(
    SignUpClicked event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(signUpStatus: SignUpStatus.loading));
    final result = await _userRepository.addUser(user: event.user);
    switch (result) {
      case Ok():
        emit(state.copyWith(signUpStatus: SignUpStatus.success));
        break;
      case Error():
        emit(state.copyWith(signUpStatus: SignUpStatus.failure));
        break;
    }
  }
}
