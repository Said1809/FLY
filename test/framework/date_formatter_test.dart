import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/framework/date_formatter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('ru', null);
  });

  test('dayMonth formats date in Russian locale', () {
    final formatted = DateFormatter.dayMonth(DateTime(2026, 6, 24));

    expect(formatted, contains('24'));
    expect(formatted.toLowerCase(), contains('июн'));
  });

  test('fullDate includes year', () {
    final formatted = DateFormatter.fullDate(DateTime(2026, 6, 24));

    expect(formatted, contains('2026'));
    expect(formatted, contains('24'));
  });
}
