import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/Pin.dart';
import 'package:app1/model/User.dart';

abstract class PinRepository {

  Future<Pin> create(Pin pin);

  Future<bool> validate(Pin pin);
}
