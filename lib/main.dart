import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Oga mi',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '22';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                output,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('x'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('00'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('CLEAR'),
                    _buildButton('='),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => _buttonPressed(buttonText),
      ),
    );
  }

  _buttonPressed(buttonText) {
    if (buttonText == 'CLEAR') {
       _output = '0';
       num1 = 0.0;
       num2 = 0.0;
       operand = '';
    } else if(buttonText == 'x' || buttonText == '-' || buttonText == '+' || buttonText == '/'){
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if(buttonText == '.'){
      if(_output.contains('.')){
        print('Already contains a decimal');
        return;
      } else{
        _output = _output + buttonText; 
      }
    } else if(buttonText == '='){
      num2 = double.parse(output);

      if(operand == '+'){
        _output = (num1 + num2).toString();
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
      }
      if(operand == '/'){
        _output = (num1 / num2).toString();
      }
      if(operand == 'x'){
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '0';
    }else{
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
       output = double.parse(_output).toStringAsFixed(2); 
    });
  }
}
