import 'package:flutter/material.dart';
import 'package:home_screen_design/pages/dashBoard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina de Inicio 2',
      theme: ThemeData(
        primarySwatch: Colors.blue[1000],
      ),
      home: Dashboard(),
    );
  }
}
