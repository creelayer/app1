
import 'package:app1/component/dialog/InformDialog.dart';
import 'package:app1/component/validator/BaseValidatorBuilder.dart';
import 'package:app1/presentation/Code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneController = TextEditingController();
  final _btnController = new RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: EdgeInsets.all(20),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
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
          "Ваш номер телефону",
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        CupertinoTextField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          prefix: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("+38"),
          ),
        ),
        SizedBox(height: 10),
        RoundedLoadingButton(
          child: Text('Вхід', style: TextStyle(color: Colors.white)),
          controller: _btnController,
          onPressed: _next,
        ),
      ],
    ));
  }

  void _next() {

    final validate =
        BaseValidatorBuilder().phone("Invalid number format").build();

    String message = validate(_phoneController.value.text);

    if (message != null) {
      showCupertinoDialog(
          context: context,
          builder: (context) =>
              InformDialog.ok(context, Text('error'), Text(message)));

      return _btnController.reset();
    }

    _btnController.reset();

    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => Code(_phoneController.value.text)));
  }
}
