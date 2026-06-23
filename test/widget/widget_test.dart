import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/entity/task.dart';
import 'package:fly/src/presentation/widgets/task_card.dart';

void main() {
  testWidgets('TaskCard shows title and time', (tester) async {
    final task = Task(
      id: '1',
      title: 'Лабораторная работа',
      description: 'Описание',
      date: DateTime(2026, 6, 24),
      time: const TimeOfDay(hour: 9, minute: 15),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TaskCard(
            task: task,
            onTap: () {},
            onToggle: () {},
            backgroundColor: Colors.white,
            markerColor: const Color(0xFFB989FE),
          ),
        ),
      ),
    );

    expect(find.text('Лабораторная работа'), findsOneWidget);
    expect(find.text('09:15'), findsOneWidget);
  });

  testWidgets('TaskCard shows placeholder when time is missing', (tester) async {
    final task = Task(
      id: '2',
      title: 'Без времени',
      description: '',
      date: DateTime(2026, 6, 24),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TaskCard(
            task: task,
            onTap: () {},
            onToggle: () {},
            backgroundColor: Colors.white,
            markerColor: const Color(0xFFB989FE),
          ),
        ),
      ),
    );

    expect(find.text('Без времени'), findsOneWidget);
    expect(find.text('--:--'), findsOneWidget);
  });
}
