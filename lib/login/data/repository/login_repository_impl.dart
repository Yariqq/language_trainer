import 'package:seven/login/data/mapper/token_model_mapper.dart';
import 'package:seven/login/data/mapper/user_mapper.dart';
import 'package:seven/login/data/source/login_data_source/login_data_source.dart';
import 'package:seven/login/data/source/token_data_source/token_data_source.dart';
import 'package:seven/login/domain/entity/token_model.dart';
import 'package:seven/login/domain/entity/user.dart';
import 'package:seven/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource dataSource;
  final TokenDataSource tokenDataSource;
  final UserMapper userMapper;
  final TokenModelMapper tokenModelMapper;

  LoginRepositoryImpl({
    required this.dataSource,
    required this.tokenDataSource,
    required this.userMapper,
    required this.tokenModelMapper,
  });

  @override
  Future<TokenModel> login({required User user}) async {
    final response = await dataSource.login(
      request: userMapper.mapToBean(user),
    );

    final tokenInfo = tokenModelMapper.mapFromBean(response);

    tokenDataSource.setTokenInfo(tokenModel: tokenInfo);

    return tokenInfo;
  }
}
