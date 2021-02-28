import 'dart:async';

import 'package:app1/model/AccessToken.dart';
import 'package:app1/model/Pin.dart';
import 'package:app1/model/User.dart';
import 'package:app1/repository/FakeAccessTokenRepository.dart';
import 'package:app1/repository/FakePinRepository.dart';
import 'package:app1/repository/FakeUserRepository.dart';
import 'package:app1/service/AuthenticationService.dart';
import 'package:app1/service/BaseAuthenticationService.dart';
import 'package:app1/service/FakeGatewayService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/foundation.dart';

class Code extends StatefulWidget {
  final String _phone;

  Code(this._phone, {Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState(_phone);
}

class _LoginState extends State<Code> {
  final _btnController = new RoundedLoadingButtonController();
  final AuthenticationService _authenticationService =
      BaseAuthenticationService(FakeGatewayService(), FakeUserRepository(),
          FakeAccessTokenRepository(), FakePinRepository());
  final String _phone;

  List<String> _pin = List<String>.filled(4, "");

  _LoginState(this._phone);

  @override
  Widget build(BuildContext context) {
    _authenticationService.createPinAccess(_phone);

    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: EdgeInsets.all(20),
          height: 200,
          child: _getForm(),
        ),
      ),
    );
  }

  Widget _getForm() {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Text(
          "Код підтвердження",
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            _pinInputField(0),
            _pinInputField(1),
            _pinInputField(2),
            _pinInputField(3)
          ],
        ),
        SizedBox(height: 10),
        RoundedLoadingButton(
          child: Text('Далі', style: TextStyle(color: Colors.white)),
          controller: _btnController,
          onPressed: _login,
        ),
      ],
    ));
  }

  Expanded _pinInputField(int index) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: CupertinoTextField(
        onChanged: (element) {
          _pin[index] = element;
        },
        // controller: _phoneController,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, style: BorderStyle.solid),
          ),
        ),
      ),
    ));
  }

  void _login() {
    _authenticationService
        .auth(Pin(int.parse(_pin.join()), _phone))
        .then((AccessToken token) {
      _btnController.reset();
    });

    //_authenticationService.login(phone, pin);
  }
}
