import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/User.dart';

abstract class AccessTokenRepository {
  Future<AccessToken> createByUser(User user);
}
