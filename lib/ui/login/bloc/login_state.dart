part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;
  bool get isLoading => this == LoginStatus.loading;
  bool get isSuccess => this == LoginStatus.success;
  bool get isFailure => this == LoginStatus.failure;
}

final class LoginState extends Equatable {
  const LoginState({this.userId = '', this.loginStatus = LoginStatus.initial});

  final LoginStatus loginStatus;
  final String userId;

  LoginState copyWith({LoginStatus? loginStatus, String? userId}) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object> get props => [loginStatus, userId];
}
