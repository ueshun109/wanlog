import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension FormatLocale on DateTime {
  String get japanese {
    initializeDateFormatting('ja');
    DateFormat formatter = DateFormat.yMMMEd('ja');
    return formatter.format(this);
  }
}