import 'package:seven/common/usecase/base_future_usecase.dart';
import 'package:seven/login/domain/entity/token_model.dart';
import 'package:seven/login/domain/entity/user.dart';
import 'package:seven/login/domain/repository/login_repository.dart';

class LoginUseCase extends BaseFutureUseCase<User, TokenModel> {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<TokenModel> execute([User? input]) {
    return repository.login(user: input!);
  }
}
