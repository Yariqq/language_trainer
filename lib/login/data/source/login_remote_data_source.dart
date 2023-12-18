import 'package:seven/login/data/source/api/login_service_api.dart';
import 'package:seven/login/data/source/login_data_source.dart';
import 'package:seven/login/data/source/model/token_model_response.dart';
import 'package:seven/login/data/source/model/user_request_body.dart';

class LoginRemoteDataSource extends LoginDataSource {
  final LoginServiceApi api;

  LoginRemoteDataSource({required this.api});

  @override
  Future<TokenModelResponse> login({required UserRequestBody request}) {
    return api.login(request);
  }
}
