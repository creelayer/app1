import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/Pin.dart';
import 'package:app1/model/User.dart';
import 'package:app1/repository/AccessTokenRepository.dart';
import 'package:app1/repository/PinRepository.dart';
import 'package:app1/repository/UserRepository.dart';
import 'package:app1/service/AuthenticationService.dart';
import 'package:app1/service/GatewayService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseAuthenticationService extends AuthenticationService {
  UserRepository _userRepository;
  GatewayService _gatewayService;
  AccessTokenRepository _accessTokenRepository;
  PinRepository _pinRepository;

  BaseAuthenticationService(this._gatewayService, this._userRepository,
      this._accessTokenRepository, this._pinRepository);

  @override
  Future<Void> createPinAccess(String phone) {
    Random rng = new Random();
    int code = rng.nextInt(9000) + 1000;
    return _pinRepository.create(Pin(code, phone)).then((pin) {
      return _gatewayService.send(pin);
    });
  }

  @override
  Future<AccessToken> auth(Pin pin) {
    return _pinRepository.validate(pin).then((value) {
      return _userRepository
          .upsert(User(phone: pin.phone))
          .then((user) => createAccess(user));
    });
  }

  Future<AccessToken> createAccess(User user) {
    return _accessTokenRepository.createByUser(user).then((token) {
      SharedPreferences.getInstance().then((value) => {
            value.setString('access', token.access),
            value.setString('refresh', token.refresh)
          });
      return Future.value(token);
    });
  }

  @override
  Future<AccessToken> session() {
    return SharedPreferences.getInstance().then((value) {
      String access = value.getString("secret");
      String refresh = value.getString("refresh");
      return Future.value(AccessToken(access, refresh));
    });
  }
}
