import 'dart:ffi';

import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/Pin.dart';
import 'package:app1/model/User.dart';

abstract class AuthenticationService {

  Future<Void> createPinAccess(String phone);

  Future<AccessToken> auth(Pin pin);

  Future<AccessToken> createAccess(User user);

  Future<AccessToken> session();
}
