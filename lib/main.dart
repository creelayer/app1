import 'package:app1/internal/Application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'User name2');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        Text(
          "User name",
          style: TextStyle(fontSize: 20.0),
        ),
        CupertinoTextField(
          controller: _textController,
        ),
      ],
    ));
  }
}

class MyBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Align(
          child: MyForm(),
          alignment: Alignment.centerRight,
        ),
      ),
    );
  }
}

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//       padding: EdgeInsets.only(top: 10.0),
//       child: Center(
//         child: Column(
//           children: [
//             Text('Hello world!'),
//             FlatButton(
//               onPressed: () async {
//                 const url = 'https://google.com';
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//               child: Text('Open site'),
//               color: Colors.red,
//               textColor: Colors.white,
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
