import 'dart:ui';
import 'package:intl/intl.dart';

class Utilize {
  /// convert hex color to material color.
  ///
  /// [hexColor] - example: #RRGGBB or #AARRGGBB
  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse('0x$hexColor'));
  }

  static String currencyFormat({
    int value = 0,
    int? decimalDigit = 0,
    String symbol = 'Rp.',
  }) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: symbol,
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(value);
  }

  static String unformatCurrency({
    String currency = '',
    String defaultValue = '0',
  }) {
    String numberStr = currency.replaceAll(RegExp(r'([^0-9])'), '');
    return numberStr.isEmpty ? defaultValue : numberStr;
  }
}
