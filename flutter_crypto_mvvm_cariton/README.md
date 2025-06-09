
# App Flutter - Criptomoedas com CoinMarketCap API

Este app em Flutter lista criptomoedas em tempo real usando a arquitetura MVVM e a API CoinMarketCap.

## Funcionalidades
- Busca por múltiplos símbolos (ex: BTC,ETH,DOGE)
- Atualização com pull-to-refresh
- Exibe detalhes da cripto em diálogo
- Cotação em USD e BRL

## Como usar
1. Cadastre-se e gere uma chave API gratuita em https://pro.coinmarketcap.com/account
2. Substitua a chave no arquivo:
   - `lib/data/datasource/crypto_api_datasource.dart` na constante `_apiKey`
3. Execute o app com `flutter run`

---

Feito para fins didáticos. Não exponha sua chave API em produção.
