
import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoApiDataSource {
  static const String _baseUrl = 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest';
  static const String _apiKey = '46671b7d-8596-4d2b-9ae5-87745fed48a1';

  Future<Map<String, dynamic>> fetchCryptoData(String symbols) async {
    final uri = Uri.parse('$_baseUrl?symbol=$symbols&convert=USD,BRL');
    final response = await http.get(uri, headers: {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': _apiKey,
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Erro ao buscar dados da API: ${response.statusCode}');
    }
  }
}
