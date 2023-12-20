import 'package:seven/login/data/source/login_data_source/login_data_source.dart';
import 'package:seven/login/data/source/model/token_model_response.dart';
import 'package:seven/login/data/source/model/user_request_body.dart';

const _loadingDuration = Duration(milliseconds: 1000);

class LoginMockDataSource extends LoginDataSource {
  @override
  Future<TokenModelResponse> login({required UserRequestBody request}) async {
    await Future.delayed(_loadingDuration);

    return Future.value(const TokenModelResponse(access: '', refresh: ''));
  }
}
