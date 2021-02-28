import 'dart:math';

import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/User.dart';
import 'package:app1/repository/AccessTokenRepository.dart';

class FakeAccessTokenRepository extends AccessTokenRepository {
  @override
  Future<AccessToken> createByUser(User user) {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    Random _rnd = Random();
    String access =  String.fromCharCodes(Iterable.generate(
        32, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    String refresh =  String.fromCharCodes(Iterable.generate(
        32, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    return Future.value(AccessToken(access, refresh));
  }
}
