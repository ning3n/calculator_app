import 'package:calculadora_app/screens/calculator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Basica',
      theme: ThemeData.dark(), //Estilo oscuro por defecto
      home: const CalculatorPage(),
    );
  }
}
