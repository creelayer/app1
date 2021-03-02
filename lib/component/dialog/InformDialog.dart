
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformDialog extends CupertinoAlertDialog{

  InformDialog.ok(BuildContext context, Widget title, Widget content) : super(title: title, content: content, actions: <Widget>[
    FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('ok'))
  ]);
}