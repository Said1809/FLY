import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/entity/week.dart';
import 'package:fly/src/model/week_calculator.dart';

void main() {
  final calculator = WeekCalculator();

  test('getCurrentWeek starts on Monday', () {
    final week = calculator.getCurrentWeek();

    expect(week.startMonday.weekday, DateTime.monday);
    expect(week.days, hasLength(7));
  });

  test('getPreviousWeek and getNextWeek shift by 7 days', () {
    final week = Week(DateTime(2026, 1, 5));
    final previous = calculator.getPreviousWeek(week);
    final next = calculator.getNextWeek(week);

    expect(previous.startMonday, DateTime(2025, 12, 29));
    expect(next.startMonday, DateTime(2026, 1, 12));
  });
}
