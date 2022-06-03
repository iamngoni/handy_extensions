import 'package:money_formatter/money_formatter.dart';

extension HandyDoubleExtension on double {
  /// Returns a [MoneyFormatterOutput] instance
  MoneyFormatterOutput get money => MoneyFormatter(amount: this).output;

  /// Returns a [MoneyFormatterCompare] instance with methods for comparisons
  MoneyFormatterCompare get compare => MoneyFormatter(amount: this).comparator;
}
