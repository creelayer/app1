
import 'package:app1/presentation/Login.dart';
import 'package:flutter/cupertino.dart';

class Application extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: Login()
    );
  }

}