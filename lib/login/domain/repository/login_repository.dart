import 'package:seven/login/domain/entity/token_model.dart';
import 'package:seven/login/domain/entity/user.dart';

abstract class LoginRepository {
  Future<TokenModel> login({required User user});
}
