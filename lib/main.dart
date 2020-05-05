import 'package:flutter/material.dart';
import 'cep_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Correios',
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: Color(0xFFEDC306),
        appBar: AppBar(
          title: Image.asset('assets/logo_correios.png'),
          backgroundColor: Color(0xFFF8F3F0),
        ),
        body: CEP(),
      ),
    );
  }
}
