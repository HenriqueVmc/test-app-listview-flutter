import 'package:flutter/material.dart';
import 'package:myapp_listview/mylistview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ListView',
      home: RandomWords(),
    );
  }
}