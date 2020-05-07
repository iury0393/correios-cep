import 'networking.dart';

const cepAPIURL = 'https://viacep.com.br/ws';

class CEPData {
  Future<dynamic> getCEPData(String cep) async {
    NetworkHelper networkHelper = NetworkHelper('$cepAPIURL/$cep/json');
    var cepData = await networkHelper.getData();
    return cepData;
  }
}
