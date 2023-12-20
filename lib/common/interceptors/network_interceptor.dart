import 'package:dio/dio.dart';
import 'package:seven/login/data/source/token_data_source/token_data_source.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  final TokenDataSource tokenDataSource;

  NetworkInterceptor({required this.tokenDataSource});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (tokenDataSource.accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${tokenDataSource.accessToken}';
    }

    super.onRequest(options, handler);
  }
}
