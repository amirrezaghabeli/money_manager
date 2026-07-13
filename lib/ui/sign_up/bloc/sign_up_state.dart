part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, loading, success, failure }

extension SignUpStatusX on SignUpStatus {
  bool get isInitial => this == SignUpStatus.initial;
  bool get isLoading => this == SignUpStatus.loading;
  bool get isSuccess => this == SignUpStatus.success;
  bool get isFailure => this == SignUpStatus.failure;
}

final class SignUpState extends Equatable {
  const SignUpState({this.signUpStatus = SignUpStatus.initial});
  final SignUpStatus signUpStatus;

  SignUpState copyWith({SignUpStatus? signUpStatus}) {
    return SignUpState(signUpStatus: signUpStatus ?? this.signUpStatus);
  }

  @override
  List<Object> get props => [signUpStatus];
}
