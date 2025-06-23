import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

final moneyTextInputFormatter = CurrencyInputFormatter(
  thousandSeparator: ThousandSeparator.Comma,
  leadingSymbol: "Ksh",
  useSymbolPadding: true,
  mantissaLength: 0,
);
