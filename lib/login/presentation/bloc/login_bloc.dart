import 'package:bloc/bloc.dart';
import 'package:seven/login/domain/entity/user.dart';
import 'package:seven/login/domain/usecase/login_usecase.dart';
import 'package:seven/login/presentation/bloc/login_event.dart';
import 'package:seven/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({
    required this.loginUseCase,
  }) : super(const LoginState.initial()) {
    on<LogInEvent>(_onLogInEvent);
  }

  void _onLogInEvent(
    LogInEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(const LoginState.loading());

      await loginUseCase.execute(
        User(login: event.login, password: event.password),
      );

      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.error(e));
    }
  }
}
