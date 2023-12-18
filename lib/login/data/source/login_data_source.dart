import 'package:seven/login/data/source/model/token_model_response.dart';
import 'package:seven/login/data/source/model/user_request_body.dart';

abstract class LoginDataSource {
  Future<TokenModelResponse> login({required UserRequestBody request});
}
