
class CryptoModel {
  final String name;
  final String symbol;
  final String dateAdded;
  final double priceUsd;
  final double priceBrl;

  CryptoModel({
    required this.name,
    required this.symbol,
    required this.dateAdded,
    required this.priceUsd,
    required this.priceBrl,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    final quote = json['quote'];
    return CryptoModel(
      name: json['name'],
      symbol: json['symbol'],
      dateAdded: json['date_added'],
      priceUsd: quote['USD']['price']?.toDouble() ?? 0.0,
      priceBrl: quote['BRL']['price']?.toDouble() ?? 0.0,
    );
  }
}
