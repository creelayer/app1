import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/Pin.dart';
import 'package:app1/model/User.dart';
import 'package:app1/repository/PinRepository.dart';

class FakePinRepository extends PinRepository {
  @override
  Future<Pin> create(Pin pin) {
    return Future.delayed(Duration(seconds: 2), () {
      return pin;
    });
  }

  @override
  Future<bool> validate(Pin pin) {
    return Future.delayed(Duration(seconds: 2), () {
      return Future.value(true);
    });
  }

}
