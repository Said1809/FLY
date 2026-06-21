# Этап 3. Проектирование базы данных

Артефакты этапа (Недели 7–8, вес 10%):

| Артефакт | Файл |
|----------|------|
| ER-диаграмма (логическая модель) | [01-er-diagram.md](01-er-diagram.md) |
| DDL, ограничения | [02-ddl-and-constraints.md](02-ddl-and-constraints.md) |
| Стратегия маппинга Entity → SQLite | [03-mapping-strategy.md](03-mapping-strategy.md) |

## Реализация

Схема создаётся в `SqliteTaskRepository.createDatabase()` (`onCreate`, version 1).
Файл БД: `{databasesPath}/todo.db`.

> Одна бизнес-сущность `Task` → одна таблица `tasks`. Настройки UI хранятся
> отдельно в SharedPreferences (не реляционная БД).
