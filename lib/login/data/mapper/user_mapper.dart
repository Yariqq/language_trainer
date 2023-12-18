import 'package:seven/common/mapper/base_mapper.dart';
import 'package:seven/login/data/source/model/user_request_body.dart';
import 'package:seven/login/domain/entity/user.dart';

class UserMapper extends BaseMapper<User, UserRequestBody> {
  @override
  User mapFromBean(UserRequestBody src) {
    return User(
      login: src.name ?? '',
      password: src.password ?? '',
    );
  }

  @override
  UserRequestBody mapToBean(User src) {
    return UserRequestBody(
      name: src.login,
      password: src.password,
    );
  }
}
