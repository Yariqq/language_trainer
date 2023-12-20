import 'package:auto_route/auto_route.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:seven/app/router/app_router.gr.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/login/domain/usecase/login_usecase.dart';
import 'package:seven/login/presentation/bloc/login_bloc.dart';
import 'package:seven/login/presentation/bloc/login_event.dart';
import 'package:seven/login/presentation/bloc/login_state.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final di = CherryPick.openRootScope();

    return BlocProvider(
      create: (context) => LoginBloc(
        loginUseCase: di.resolve<LoginUseCase>(),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          context.loaderOverlay.hide();

          if (state is LoadingState) {
            context.loaderOverlay.show();
          }

          if (state is SuccessState) {
            context.pushRoute(const AuthEmptyRoute(children: [RootRoute()]));
          }

          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Something went wrong -- ${state.e}'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CommonSize.paddingDefault,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.login),
                    const SizedBox(height: CommonSize.paddingLarge),
                    TextFormField(
                      controller: _loginController,
                      decoration: const InputDecoration(
                        labelText: 'Login',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Fill in the field';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: CommonSize.paddingDefault),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Fill in the field';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: CommonSize.paddingLarge),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<LoginBloc>().add(
                                LoginEvent.login(
                                  login: _loginController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(CommonSize.paddingMedium),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.deepPurpleAccent,
                        ),
                      ),
                      child: Text(
                        'Log in',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
