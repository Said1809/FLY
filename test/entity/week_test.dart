import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/entity/week.dart';

void main() {
  test('Week contains 7 days starting from Monday', () {
    final monday = DateTime(2026, 1, 5);
    final week = Week(monday);

    expect(week.days, hasLength(7));
    expect(week.days.first.weekday, DateTime.monday);
    expect(week.days.last.weekday, DateTime.sunday);
    expect(week.days.last, DateTime(2026, 1, 11));
  });
}
