
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../view_model/crypto_view_model.dart';
import 'crypto_details_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CryptoViewModel(),
      child: const CryptoBody(),
    );
  }
}

class CryptoBody extends StatefulWidget {
  const CryptoBody({super.key});

  @override
  State<CryptoBody> createState() => _CryptoBodyState();
}

class _CryptoBodyState extends State<CryptoBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CryptoViewModel>(context, listen: false).fetchCryptos('');
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CryptoViewModel>(context);
    final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criptomoedas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Buscar por símbolos (ex: BTC,ETH)',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => vm.fetchCryptos(_controller.text),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (vm.loading)
              const CircularProgressIndicator()
            else if (vm.error.isNotEmpty)
              Text('Erro: ${vm.error}')
            else
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => vm.fetchCryptos(_controller.text),
                  child: ListView.builder(
                    itemCount: vm.cryptos.length,
                    itemBuilder: (_, index) {
                      final crypto = vm.cryptos[index];
                      return ListTile(
                        title: Text('${crypto.name} (${crypto.symbol})'),
                        subtitle: Text(
                          'USD: \$${crypto.priceUsd.toStringAsFixed(2)} | BRL: ${formatter.format(crypto.priceBrl)}',
                        ),
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => CryptoDetailsDialog(crypto: crypto),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
