import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = '0'; //Lo que se muestra en pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          //Pantalla de resultado
          Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          //Botones
          Expanded(
            child: GridView.count(
              crossAxisCount: 4, //4 columnas
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('X'),
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
                _buildButton('C'),
                _buildButton('0'),
                _buildButton('='),
                _buildButton('+'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildButton(String label){
    return ElevatedButton(
      onPressed: () => _onButtonPressed(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(24),
        textStyle: TextStyle(fontSize: 24),
      ), 
      child: Text(label)
      );
  }

  void _onButtonPressed(String value){
    setState(() {
      //Si el usuario presiona 'C', limpiamos la pantalla
      if(value == 'C'){
        _output = '0';
      }else if (_output == '0'){
        _output = value; //reemplazamos el 0 inicial
      }else{
        _output += value; //concatenamos los valores
      }
    });
  }
}