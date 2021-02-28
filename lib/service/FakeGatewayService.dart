import 'dart:ffi';

import 'package:app1/model/Pin.dart';
import 'package:app1/service/GatewayService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeGatewayService extends GatewayService {
  Future<Void> send(Pin pin) {
    return Future.delayed(Duration(seconds: 2), () {
      SharedPreferences.getInstance().then((value) => value.setInt("code", pin.code));
      return;
    });
  }
}
