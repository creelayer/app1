import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/User.dart';

abstract class UserRepository {

  Future<User> upsert(User user);

  Future<User> findByToken(AccessToken token);
}
