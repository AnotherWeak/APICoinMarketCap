
import 'package:flutter/material.dart';
import '../data/models/crypto_model.dart';
import '../data/repository/crypto_repository.dart';

class CryptoViewModel extends ChangeNotifier {
  final CryptoRepository _repository = CryptoRepository();

  List<CryptoModel> _cryptos = [];
  List<CryptoModel> get cryptos => _cryptos;

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  Future<void> fetchCryptos(String symbols) async {
    _loading = true;
    _error = '';
    notifyListeners();
    try {
      if (symbols.trim().isEmpty) {
        symbols =
            'BTC,ETH,SOL,BNB,BCH,MKR,AAVE,DOT,SUI,ADA,XRP,TIA,NEO,NEAR,PENDLE,RENDER,LINK,TON,XAI,SEI,IMX,ETHFI,UMA,SUPER,FET,USUAL,GALA,PAAL,AERO';
      }
      _cryptos = await _repository.getCryptos(symbols.toUpperCase());
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
