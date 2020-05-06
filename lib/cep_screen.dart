import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CEP extends StatefulWidget {
  @override
  _CEPState createState() => _CEPState();
}

class _CEPState extends State<CEP> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Informe seu CEP',
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Source Sans Pro',
                color: Color(0xFF1A5077),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    inputFormatters: [maskFormatter],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: Color(0xFF1A5077),
                      ),
                      hintText: 'CEP',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ButtonTheme(
              child: RaisedButton(
                child: const Text(
                  'Pesquisar',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Color(0xFF1A5077),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                splashColor: Color(0xFFF8F3F0),
                onPressed: () {
                  print('Pressionado');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
