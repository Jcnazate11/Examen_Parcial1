import 'package:flutter/material.dart';
import 'pages/screen_welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teorema de Pitágoras',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenWelcome(),
    );
  }
}
