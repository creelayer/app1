import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/User.dart';
import 'package:app1/repository/UserRepository.dart';

class FakeUserRepository extends UserRepository {
  @override
  Future<User> upsert(User user) {
    return Future.delayed(Duration(seconds: 2), () {
      return user;
    });
  }

  @override
  Future<User> findByToken(AccessToken token) async {
    return Future.delayed(Duration(seconds: 2), () {
      return User(phone: "0000000000");
    });
  }
}
