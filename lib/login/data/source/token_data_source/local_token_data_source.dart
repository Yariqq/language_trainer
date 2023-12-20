import 'package:seven/login/data/source/token_data_source/token_data_source.dart';
import 'package:seven/login/domain/entity/token_model.dart';

class LocalTokenDataSource extends TokenDataSource {
  TokenModel _tokenModel = TokenModel.empty();

  @override
  String get accessToken => _tokenModel.accessToken;

  @override
  void setTokenInfo({required TokenModel tokenModel}) {
    _tokenModel = tokenModel;
  }
}
