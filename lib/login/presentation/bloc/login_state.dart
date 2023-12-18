import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  const factory LoginState.initial() = InitialState;

  const factory LoginState.loading() = LoadingState;

  const factory LoginState.success() = SuccessState;

  const factory LoginState.error(Object e) = ErrorState;
}

class InitialState extends LoginState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends LoginState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends LoginState {
  const SuccessState();

  @override
  List<Object?> get props => [];
}

class ErrorState extends LoginState {
  final Object e;

  const ErrorState(this.e);

  @override
  List<Object?> get props => [e];
}
