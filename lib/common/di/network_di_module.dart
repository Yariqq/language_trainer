import 'package:cherrypick/cherrypick.dart';
import 'package:dio/dio.dart';
import 'package:seven/common/interceptors/network_interceptor.dart';
import 'package:seven/login/data/source/token_data_source/token_data_source.dart';

class NetworkDiModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<BaseOptions>()
        .toProvide(() => BaseOptions(
              baseUrl: currentScope.resolve<String>(named: 'baseUrl'),
              connectTimeout:
                  currentScope.resolve<Duration>(named: 'connectionTimeout'),
              receiveTimeout:
                  currentScope.resolve<Duration>(named: 'receiveTimeout'),
              sendTimeout: currentScope.resolve<Duration>(named: 'sendTimeout'),
            ))
        .singleton();

    bind<Dio>().toProvide(() {
      final dio = Dio(currentScope.resolve<BaseOptions>())
        ..interceptors.addAll(
          [
            NetworkInterceptor(
              tokenDataSource: currentScope.resolve<TokenDataSource>(),
            ),
          ],
        );
      return dio;
    }).singleton();
  }
}
