import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

import '../constants/constants.dart';

extension CurrencyExtensions on double {
  String shortMoneyFormat(
    BuildContext? context, {
    bool shortFormat = false,
    String currency = 'KES',
  }) {
    MoneyFormatterOutput formatter = MoneyFormatter(
      amount: this,
      settings: MoneyFormatterSettings(
        symbol: currency,
        thousandSeparator: ',',
        decimalSeparator: '.',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 2,
        compactFormatType: CompactFormatType.short,
      ),
    ).output;

    if (context != null) {
      return shortFormat
          ? formatter.compactSymbolOnLeft
          : formatter.symbolOnLeft;
    } else {
      return shortFormat
          ? formatter.compactSymbolOnLeft
          : formatter.symbolOnLeft;
    }
  }
}
