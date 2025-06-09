
import '../datasource/crypto_api_datasource.dart';
import '../models/crypto_model.dart';

class CryptoRepository {
  final CryptoApiDataSource _api = CryptoApiDataSource();

  Future<List<CryptoModel>> getCryptos(String symbols) async {
    final data = await _api.fetchCryptoData(symbols);
    return data.entries.map((e) => CryptoModel.fromJson(e.value[0])).toList();
  }
}
