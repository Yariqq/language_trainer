import 'package:seven/login/domain/entity/token_model.dart';

abstract class TokenDataSource {
  String get accessToken;

  void setTokenInfo({required TokenModel tokenModel});
}
