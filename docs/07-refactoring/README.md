# Этап 6. Рефакторинг и качество

Артефакты этапа (Недели 13–14, вес 10%):

| Артефакт | Файл |
|----------|------|
| Паттерн Repository | [01-repository-pattern.md](01-repository-pattern.md) |
| Отчёт статического анализа | [02-static-analysis.md](02-static-analysis.md) |

## Внедрённые паттерны (код)

- **Repository:** `TaskRepository` + `SqliteTaskRepository` / `InMemoryTaskRepository`.
- **Observer:** `ChangeNotifier` в контроллерах и `SettingsModel`.
- **Composition root:** инициализация зависимостей в `main.dart`.

## Рекомендации по рефакторингу

1. Унифицировать auth: UI → `AuthService` вместо прямых вызовов Supabase.
2. Передавать `_taskStatuses` из `HomePage` в `WeekDatesRow` для цветов на неделе.
3. Добавить `user_id` в таблицу `tasks` при облачной синхронизации.
4. Удалить неиспользуемый импорт `AuthService` в `settings_page.dart`.
