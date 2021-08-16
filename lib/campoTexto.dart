import 'package:flutter/material.dart';

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _resultado = '';

  void _calcular() {
    var alcool = double.tryParse(_controllerAlcool.text);
    var gasolina = double.tryParse(_controllerGasolina.text);

    if (alcool == null || gasolina == null) {
      setState(() {
        _resultado = "Numero inválido digite outro número com (.)";
      });
      _limpar();
    } else {
      if ((alcool / gasolina) >= 0.7) {
        setState(() {
          _resultado = "Melhor abastecer com Gasolina";
        });
      } else {
        setState(() {
          _resultado = 'Melhor abastecer com Alcool';
        });
      }
      _limpar();
    }
  }

  void _limpar() {
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alcool ou Gasolina App'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32, top: 20),
                child: Image.asset('images/logo.png'), //imagem
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual é a melhor opção para abastecer seu carro', //texto
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço alcool, Ex: 1.98',
                ),
                
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Preço Gasolina, Ex: 5.98'),
                    
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: _calcular,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
