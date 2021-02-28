
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Icon(Icons.arrow_back_ios),
        middle: Text('Epic app'),
        trailing: Icon(Icons.account_circle),
      ),
      child: Center(
        child: Container(
          color: Colors.green,
          child: Text("Flutter CheatSh1eet."),
          alignment: Alignment(0.0, 0.0),
        ),
      ),
    );
  }

}