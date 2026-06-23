import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/controller/week_controller.dart';

void main() {
  test('setWeekOffset updates offset and notifies listeners', () {
    final controller = WeekController();
    var notified = false;
    controller.addListener(() => notified = true);

    controller.setWeekOffset(2);

    expect(controller.weekOffset, 2);
    expect(notified, isTrue);
  });

  test('getWeekAtOffset returns week shifted by offset', () {
    final controller = WeekController();
    final base = controller.currentWeek.startMonday;

    final nextWeek = controller.getWeekAtOffset(1);

    expect(nextWeek.startMonday, base.add(const Duration(days: 7)));
  });

  test('goToDate moves to week containing selected date', () {
    final controller = WeekController();
    final targetDate = DateTime(2026, 6, 24);

    controller.goToDate(targetDate);

    final days = controller.currentWeek.days;
    expect(days.any((day) =>
        day.year == targetDate.year &&
        day.month == targetDate.month &&
        day.day == targetDate.day), isTrue);
  });
}
