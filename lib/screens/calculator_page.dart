import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = '0'; //Lo que se muestra en pantalla
  String _currentInput = '';
  double? _firstOperand;
  String? _operator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'), 
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Pantalla de resultado
            Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.centerRight,
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 56, 
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
                  _buildButton('.'),
                  _buildButton('+'),
                  _buildButton('='),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildButton(String label){

    final isOperator = ['+', '-', 'X', '/', '=', 'C'].contains(label);

    return ElevatedButton(
      onPressed: () => _onButtonPressed(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isOperator ? Colors.orange : Colors.grey[800],
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ), 
      child: Text(label)
      );
  }

  void _onButtonPressed(String value){
    setState(() {
      //Si el usuario presiona 'C', limpiamos la pantalla
      if(value == 'C'){
        _output = '0';
        _currentInput = '';
        _firstOperand = null;
        _operator = null;
      }else if (value == '+' || value == '-' || value == 'X' || value == '/') {
        //Guarda el primer numero y el operador
        if(_currentInput.isNotEmpty){
          _firstOperand = double.tryParse(_currentInput);
          _operator = value;
          _currentInput = '';
        }
      }else if (value == '='){
        //Ejecuta la operacion si todo esta listo
        if (_firstOperand != null && _operator != null && _currentInput.isNotEmpty){
          double secondOperand = double.tryParse(_currentInput) ?? 0;
          double result = 0;

          switch (_operator){
            case '+':
              result = _firstOperand! + secondOperand;
              break;
            case '-':
              result = _firstOperand! - secondOperand;
            case 'X':
              result = _firstOperand! * secondOperand;
              break;
            case '/':
              if (secondOperand != 0){
                result = _firstOperand! / secondOperand;
              }else{
                _output = 'ERROR';
                return;
              }
              break;
          }

          //Mostrar el Resultado
          _output = result.toString();
          _currentInput = '';
          _firstOperand = null;
          _operator = null;
        }
      } else {
        //Concatenar numeros normales
        if(value == '.' && _currentInput.contains('.')){
          return; //no permitir multiples puntos
        }
        _currentInput += value;
        _output = _currentInput;
      }
    });
  }
}