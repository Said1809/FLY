# Стратегия маппинга Entity → SQLite

## Task ↔ Row

| Поле Task (Dart) | Колонка SQLite | Преобразование |
|------------------|----------------|----------------|
| `id` | `id` | String |
| `title` | `title` | String |
| `description` | `description` | String |
| `date` | `date` | `DateTime` → `toIso8601String().split('T').first` |
| `time?.hour` | `time_hour` | int или NULL |
| `time?.minute` | `time_minute` | int или NULL |
| `isCompleted` | `is_completed` | bool → 0/1 |

## Методы маппинга

```dart
Map<String, dynamic> _taskToMap(Task task) { ... }
Task _mapRowToTask(Map<String, dynamic> row) { ... }
```

Расположение: `SqliteTaskRepository`.

## TimeOfDay

Flutter `TimeOfDay` не сериализуется в SQLite напрямую — хранится как пара
`time_hour` + `time_minute`. При чтении: если `time_hour != null`, создаётся
`TimeOfDay(hour: ..., minute: ...)`.

## InMemoryTaskRepository

Дублирует контракт `TaskRepository`, хранит `List<Task>` в RAM.
Используется для unit-тестов без инициализации sqflite.

## Нормализация

Схема соответствует **1НФ** (атомарные поля) и **2НФ** (одна сущность — одна таблица).
Для учебного MVP денormalization не требуется.
