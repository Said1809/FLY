# Ответственность слоёв

| Слой | Каталог | Ответственность | Запрещено |
|------|---------|-----------------|-----------|
| **Presentation** | `presentation/` | Отображение UI, обработка жестов, навигация | Прямые SQL-запросы, бизнес-логика |
| **Control** | `controller/` | Управление состоянием, координация операций | Прямая работа с SQLite, построение виджетов |
| **Model** | `model/` | Доступ к данным, персистентность настроек | Зависимость от Flutter-виджетов |
| **Entity** | `entity/` | Доменные объекты, инварианты | Зависимость от UI и БД |
| **Services** | `services/` | Интеграция с внешними сервисами (Supabase) | Логика отображения |
| **Foundation** | `framework/` | Утилиты (форматирование дат) | Доменная логика |

## Поток данных (пример: создание задачи)

```
AddTaskPage → TaskController.addTask() → TaskRepository.addTask()
  → SqliteTaskRepository.insert() → SQLite
  → TaskController.loadTasks() → notifyListeners()
  → HomePage (Consumer) rebuild
```

## Управление состоянием

- **Provider** регистрирует синглтоны в `main()`: `TaskController`, `WeekController`, `SettingsModel`.
- Виджеты подписываются через `context.watch<T>()` или вызывают `context.read<T>()`.
