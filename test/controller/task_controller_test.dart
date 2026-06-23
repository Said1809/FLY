import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/controller/task_controller.dart';
import 'package:fly/src/entity/task.dart';
import 'package:fly/src/model/in_memory_task_repository.dart';

Task _task({
  required String id,
  required DateTime date,
  bool isCompleted = false,
}) {
  return Task(
    id: id,
    title: 'Задача $id',
    description: 'Описание',
    date: date,
    isCompleted: isCompleted,
  );
}

void main() {
  late InMemoryTaskRepository repository;
  late TaskController controller;
  final date = DateTime(2026, 6, 24);

  setUp(() {
    repository = InMemoryTaskRepository();
    controller = TaskController(repository);
  });

  test('loadTasks loads tasks for selected date', () async {
    await repository.addTask(_task(id: '1', date: date));
    await controller.loadTasks(date);

    expect(controller.tasksForDate, hasLength(1));
    expect(controller.currentDate, date);
  });

  test('addTask adds task and reloads list', () async {
    await controller.loadTasks(date);
    await controller.addTask(_task(id: '1', date: date));

    expect(controller.tasksForDate, hasLength(1));
  });

  test('toggleComplete marks task as completed', () async {
    final task = _task(id: '1', date: date);
    await repository.addTask(task);
    await controller.loadTasks(date);

    await controller.toggleComplete(task);

    expect(controller.tasksForDate.single.isCompleted, isTrue);
  });

  test('deleteTask removes task from list', () async {
    final task = _task(id: '1', date: date);
    await repository.addTask(task);
    await controller.loadTasks(date);

    await controller.deleteTask(task.id);

    expect(controller.tasksForDate, isEmpty);
  });

  test('getDateTaskStatus returns none, active and completed', () async {
    expect(await controller.getDateTaskStatus(date), 'none');

    await repository.addTask(_task(id: '1', date: date));
    expect(await controller.getDateTaskStatus(date), 'active');

    await repository.updateTask(_task(id: '1', date: date, isCompleted: true));
    expect(await controller.getDateTaskStatus(date), 'completed');
  });
}
