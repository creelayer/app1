import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/Pin.dart';
import 'package:app1/model/User.dart';
import 'package:app1/repository/PinRepository.dart';

class FakePinRepository extends PinRepository {
  @override
  Future<Pin> create(Pin pin) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> validate(Pin pin) {
    // TODO: implement validate
    throw UnimplementedError();
  }

}
