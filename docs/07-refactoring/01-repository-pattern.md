# Паттерн Repository

## Проблема

`TaskController` не должен содержать SQL-запросы и знать о sqflite.

## Решение

```dart
abstract class TaskRepository {
  Future<List<Task>> getTasksByDate(DateTime date);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}
```

## Реализации

| Класс | Назначение |
|-------|------------|
| `SqliteTaskRepository` | Production — файл `todo.db` |
| `InMemoryTaskRepository` | Тесты — список в RAM |

## Преимущества

- Подмена хранилища без изменения контроллера
- Единая точка CRUD
- Соответствие принципу инверсии зависимостей

## Расположение

- Интерфейс: `lib/src/model/task_repository.dart`
- SQLite: `lib/src/model/sqlite_task_repository.dart`
- In-memory: `lib/src/model/in_memory_task_repository.dart`
