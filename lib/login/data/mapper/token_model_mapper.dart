import 'package:seven/common/mapper/base_mapper.dart';
import 'package:seven/login/data/source/model/token_model_response.dart';
import 'package:seven/login/domain/entity/token_model.dart';

class TokenModelMapper extends BaseMapper<TokenModel, TokenModelResponse> {
  @override
  TokenModel mapFromBean(TokenModelResponse src) {
    return TokenModel(
      accessToken: src.access ?? '',
      refreshToken: src.refresh ?? '',
    );
  }

  @override
  TokenModelResponse mapToBean(TokenModel src) {
    return TokenModelResponse(
      access: src.accessToken,
      refresh: src.refreshToken,
    );
  }
}
