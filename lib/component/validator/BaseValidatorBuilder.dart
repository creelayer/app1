
import 'package:form_validator/form_validator.dart';

class BaseValidatorBuilder extends ValidationBuilder{

  static final RegExp _phoneRegExp = RegExp(r'^\d{10}$');
  static final RegExp _pinRegExp = RegExp(r'^\d{4}$');

  /// Value must be a well formatted phone number
  ValidationBuilder phone([String message]) =>
      add((v) => _phoneRegExp.hasMatch(v)
          ? null
          : message);

  /// Value must be a well formatted phone number
  ValidationBuilder pin([String message]) =>
      add((v) => _pinRegExp.hasMatch(v)
          ? null
          : message);

}