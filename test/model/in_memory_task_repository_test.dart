import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/entity/task.dart';
import 'package:fly/src/model/in_memory_task_repository.dart';

Task _task({
  required String id,
  required DateTime date,
  TimeOfDay? time,
  bool isCompleted = false,
}) {
  return Task(
    id: id,
    title: 'Задача $id',
    description: 'Описание',
    date: date,
    time: time,
    isCompleted: isCompleted,
  );
}

void main() {
  late InMemoryTaskRepository repository;
  final date = DateTime(2026, 6, 24);

  setUp(() {
    repository = InMemoryTaskRepository();
  });

  test('addTask and getTasksByDate return tasks for date', () async {
    await repository.addTask(_task(id: '1', date: date));
    await repository.addTask(_task(id: '2', date: DateTime(2026, 6, 25)));

    final tasks = await repository.getTasksByDate(date);

    expect(tasks, hasLength(1));
    expect(tasks.first.id, '1');
  });

  test('tasks are sorted by time, tasks without time go last', () async {
    await repository.addTask(_task(id: 'late', date: date, time: const TimeOfDay(hour: 15, minute: 0)));
    await repository.addTask(_task(id: 'none', date: date));
    await repository.addTask(_task(id: 'early', date: date, time: const TimeOfDay(hour: 9, minute: 0)));

    final tasks = await repository.getTasksByDate(date);

    expect(tasks.map((t) => t.id), ['early', 'late', 'none']);
  });

  test('updateTask changes task fields', () async {
    final task = _task(id: '1', date: date);
    await repository.addTask(task);
    await repository.updateTask(
      Task(
        id: task.id,
        title: 'Обновлено',
        description: task.description,
        date: task.date,
        isCompleted: true,
      ),
    );

    final tasks = await repository.getTasksByDate(date);

    expect(tasks.single.title, 'Обновлено');
    expect(tasks.single.isCompleted, isTrue);
  });

  test('deleteTask removes task', () async {
    await repository.addTask(_task(id: '1', date: date));
    await repository.deleteTask('1');

    final tasks = await repository.getTasksByDate(date);

    expect(tasks, isEmpty);
  });
}
