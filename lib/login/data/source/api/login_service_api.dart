import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seven/login/data/source/model/token_model_response.dart';
import 'package:seven/login/data/source/model/user_request_body.dart';

part 'login_service_api.g.dart';

@RestApi(baseUrl: 'http://3.94.1.12:8000/')
abstract class LoginServiceApi {
  factory LoginServiceApi(Dio dio, {String baseUrl}) = _LoginServiceApi;

  @POST('api/auth/login')
  Future<TokenModelResponse> login(
    @Body() UserRequestBody body,
  );
}
