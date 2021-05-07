import 'package:flutter/material.dart';
import 'Layouts/introScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thriftini',
      home: Scaffold(body: IntroScreen(),
      backgroundColor: Colors.black12,),
    );
  }
}
