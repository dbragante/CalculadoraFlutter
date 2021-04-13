import 'package:calculadora/controlers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDisplayTop(text: _controller.historydigit),
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.white),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Calculadora', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.share),
          onPressed: () {
            Share.share(
                'Faça o download do código em "https://github.com/dbragante/CalculadoraFlutter"');
          },
        ),
      ],
    );
  }

  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontSize: 52,
            fontFamily: 'Calculator',
          ),
        ),
      ),
    );
  }

  Widget _buildDisplayTop({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.topRight,
        child: Text(
          text ?? '',
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Calculator',
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.black,
      height: height * 0.65 > 500.0 ? 500 : height * 0.65,
      child: Column(
        children: [
          _buildKeyboardLine1(),
          _buildKeyboardLine2(),
          _buildKeyboardLine3(),
          _buildKeyboardLine4(),
          _buildKeyboardLine5(),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine1() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: 'AC', color: Colors.deepOrangeAccent),
          _buildButton(label: 'DEL', color: Colors.deepOrangeAccent),
          _buildButton(label: '%', color: Colors.deepOrangeAccent),
          _buildButton(label: '/', color: Colors.deepOrangeAccent),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine2() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '7'),
          _buildButton(label: '8'),
          _buildButton(label: '9'),
          _buildButton(label: 'x', color: Colors.deepOrangeAccent),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine3() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '4'),
          _buildButton(label: '5'),
          _buildButton(label: '6'),
          _buildButton(label: '-', color: Colors.deepOrangeAccent),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine4() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '1'),
          _buildButton(label: '2'),
          _buildButton(label: '3'),
          _buildButton(label: '+', color: Colors.deepOrangeAccent),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine5() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '0', flex: 2),
          _buildButton(label: ','),
          _buildButton(label: '=', color: Colors.deepOrangeAccent),
        ],
      ),
    );
  }

  Widget _buildButton(
      {String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            color: color,
          ),
        ),
        color: Colors.black,
        onPressed: () => _calculatorLogic(label),
      ),
    );
  }

  _calculatorLogic(String label) {
    setState(() {
      _controller.applyCommand(label);
    });
  }
}
