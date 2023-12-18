import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  const factory LoginEvent.login({
    required String login,
    required String password,
  }) = LogInEvent;
}

class LogInEvent extends LoginEvent {
  final String login;
  final String password;

  const LogInEvent({required this.login, required this.password});

  @override
  List<Object?> get props => [login, password];
}
