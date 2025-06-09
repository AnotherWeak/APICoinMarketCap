
import 'package:flutter/material.dart';
import '../data/models/crypto_model.dart';
import 'package:intl/intl.dart';

class CryptoDetailsDialog extends StatelessWidget {
  final CryptoModel crypto;

  const CryptoDetailsDialog({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return AlertDialog(
      title: Text('${crypto.name} (${crypto.symbol})'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Adicionado em: ${crypto.dateAdded.split("T")[0]}'),
          Text('Preço em USD: \$${crypto.priceUsd.toStringAsFixed(2)}'),
          Text('Preço em BRL: ${formatter.format(crypto.priceBrl)}'),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Fechar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
