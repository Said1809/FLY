# DDL и ограничения

## Скрипт создания таблицы

Источник: `lib/src/model/sqlite_task_repository.dart`

```sql
CREATE TABLE tasks (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  date TEXT NOT NULL,
  time_hour INTEGER,
  time_minute INTEGER,
  is_completed INTEGER NOT NULL DEFAULT 0
);
```

## Ограничения

| Поле | Ограничение | Обоснование |
|------|-------------|-------------|
| `id` | PRIMARY KEY | Уникальный идентификатор (timestamp ms) |
| `title` | NOT NULL | Название обязательно |
| `description` | NOT NULL | Пустая строка допустима |
| `date` | NOT NULL | Формат ISO `YYYY-MM-DD` |
| `time_hour`, `time_minute` | NULLABLE | Время опционально |
| `is_completed` | NOT NULL, DEFAULT 0 | 0 = false, 1 = true |

## Индексы

Явные индексы не созданы (объём данных на устройстве невелик).
При росте данных рекомендуется: `CREATE INDEX idx_tasks_date ON tasks(date);`

## Запросы

**Выборка по дате:**
```sql
SELECT * FROM tasks WHERE date = ? ORDER BY time_hour IS NULL, time_hour, time_minute;
```

**Сортировка:** задачи с временем — по возрастанию; без времени — в конце списка.

## Версионирование

| Версия БД | Изменения |
|-----------|-----------|
| 1 | Начальная схема, таблица `tasks` |

Миграции (`onUpgrade`) не реализованы — достаточно для MVP.
