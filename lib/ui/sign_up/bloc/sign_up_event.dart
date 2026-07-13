part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpClicked extends SignUpEvent {
  final User user;

  const SignUpClicked({required this.user});
}
