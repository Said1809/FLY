import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/entity/task.dart';

void main() {
  test('Task stores fields and default isCompleted is false', () {
    final task = Task(
      id: '1',
      title: 'Математика',
      description: 'Контрольная',
      date: DateTime(2026, 6, 24),
      time: const TimeOfDay(hour: 10, minute: 30),
    );

    expect(task.id, '1');
    expect(task.title, 'Математика');
    expect(task.description, 'Контрольная');
    expect(task.time, const TimeOfDay(hour: 10, minute: 30));
    expect(task.isCompleted, isFalse);
  });

  test('Task can be completed', () {
    final task = Task(
      id: '2',
      title: 'Физика',
      description: '',
      date: DateTime(2026, 6, 24),
      isCompleted: true,
    );

    expect(task.isCompleted, isTrue);
    expect(task.time, isNull);
  });
}
