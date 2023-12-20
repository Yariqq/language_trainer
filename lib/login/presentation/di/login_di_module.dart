import 'package:cherrypick/cherrypick.dart';
import 'package:dio/dio.dart';
import 'package:seven/login/data/mapper/token_model_mapper.dart';
import 'package:seven/login/data/mapper/user_mapper.dart';
import 'package:seven/login/data/repository/login_repository_impl.dart';
import 'package:seven/login/data/source/api/login_service_api.dart';
import 'package:seven/login/data/source/login_data_source/login_data_source.dart';
import 'package:seven/login/data/source/login_data_source/login_mock_data_source.dart';
import 'package:seven/login/data/source/login_data_source/login_remote_data_source.dart';
import 'package:seven/login/data/source/token_data_source/local_token_data_source.dart';
import 'package:seven/login/data/source/token_data_source/token_data_source.dart';
import 'package:seven/login/domain/repository/login_repository.dart';
import 'package:seven/login/domain/usecase/login_usecase.dart';

class LoginDiModule extends Module {
  @override
  void builder(Scope currentScope) {
    _bindMappers(currentScope);
    _bindDataSources(currentScope);
    _bindRepositories(currentScope);
    _bindUseCases(currentScope);
  }

  void _bindMappers(Scope scope) {
    bind<UserMapper>().toInstance(UserMapper());

    bind<TokenModelMapper>().toInstance(TokenModelMapper());
  }

  void _bindDataSources(Scope scope) {
    bind<LoginDataSource>().toProvide(() {
      if (scope.resolve<bool>(named: 'isMock')) {
        return LoginMockDataSource();
      }

      final baseUrl = scope.resolve<String>(named: 'baseUrl');

      return LoginRemoteDataSource(
        api: LoginServiceApi(
          scope.resolve<Dio>(),
          baseUrl: baseUrl,
        ),
      );
    });

    bind<TokenDataSource>().toProvide(() => LocalTokenDataSource()).singleton();
  }

  void _bindRepositories(Scope scope) {
    bind<LoginRepository>().toProvide(
      () => LoginRepositoryImpl(
        dataSource: scope.resolve<LoginDataSource>(),
        tokenDataSource: scope.resolve<TokenDataSource>(),
        userMapper: scope.resolve<UserMapper>(),
        tokenModelMapper: scope.resolve<TokenModelMapper>(),
      ),
    );
  }

  void _bindUseCases(Scope scope) {
    bind<LoginUseCase>().toProvide(
      () => LoginUseCase(
        repository: scope.resolve<LoginRepository>(),
      ),
    );
  }
}
