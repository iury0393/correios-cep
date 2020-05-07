import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:correioscep/services/cep_data.dart';

class CEP extends StatefulWidget {
  @override
  _CEPState createState() => _CEPState();
}

class _CEPState extends State<CEP> {
  CEPData cep = CEPData();
  var campoCEP = '';
  //Mask
  var textEditingController = TextEditingController(text: "12345678");
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  //Variáveis de endereço
  String adCEP;
  String adLogradouro;
  String adComplemento;
  String adBairro;
  String adLocalidade;
  String adUF;

  void getAddress(dynamic cepData) {
    setState(() {
      adCEP = cepData['cep'];
      adLogradouro = cepData['logradouro'];
      adComplemento = cepData['complemento'];
      adBairro = cepData['bairro'];
      adLocalidade = cepData['localidade'];
      adUF = cepData['uf'];

      var alertStyle = AlertStyle(
          animationType: AnimationType.fromTop,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          titleStyle: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Source Sans Pro',
            color: Color(0xFF1A5077),
          ),
          constraints: BoxConstraints.expand(width: 1000));
      Alert(
        context: context,
        style: alertStyle,
        type: AlertType.success,
        title: 'Endereço do CEP',
        desc:
            'CEP: $adCEP\n Logradouro: $adLogradouro\n Complemento: $adComplemento\n Bairro: $adBairro\n Localidade: $adLocalidade\n UF: $adUF',
        buttons: [
          DialogButton(
            child: Text(
              "VOLTAR",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color(0xFF1A5077),
          ),
        ],
      ).show();
    });
  }

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
                    onChanged: (maskFormatter) {
                      campoCEP = maskFormatter;
                    },
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
                onPressed: () async {
                  var campoUnmasked = maskFormatter.getUnmaskedText();
                  var cepData = await cep.getCEPData(campoUnmasked);
                  if (cepData != null) {
                    getAddress(cepData);
                  } else {
                    Alert(
                      context: context,
                      title: "ERRO",
                      desc: "Digite o cep correto",
                    ).show();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
