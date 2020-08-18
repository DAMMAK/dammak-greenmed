import 'package:intl/intl.dart';

class DisplayUtil {
  static String formatNumber(int number, {bool withDecimals = true}) {
    // format number based on decimals flag
    var format = withDecimals ? '#,###' : '#,###';
    var formatter = NumberFormat(format, 'en_US');
    return formatter.format(number);
  }

  static String toCapitalized(String input) =>
      "${input[0].toUpperCase()}${input.substring(1)}";

  static String getFirstName(String input) => "${input.split(" ")[0]}";
}
