import 'package:intl/intl.dart';

currencyFormat(double balance) {
  var currencyFormat = NumberFormat("#,##0.0#", "en_US");
  String currencyFormatted = currencyFormat.format(balance);

  return currencyFormatted;
}

secondCurrencyFormat(double balance) {
  var secondCurrencyFormat = NumberFormat("#,##0", "en_US");
  String currencyFormatted = secondCurrencyFormat.format(balance);

  return currencyFormatted;
}

String doubleFixedStringDecimal(String amount, int decimal) {
  return double.parse(amount).toStringAsFixed(decimal);
}