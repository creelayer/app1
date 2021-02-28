import 'dart:ffi';

import 'package:app1/model/Pin.dart';

abstract class GatewayService{

  Future<Void> send(Pin pin);

}