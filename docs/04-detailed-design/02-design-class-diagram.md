# Диаграмма классов проектирования

```plantuml
@startuml
skinparam classAttributeIconSize 0

class Task {
  +id: String
  +title: String
  +description: String
  +date: DateTime
  +time: TimeOfDay?
  +isCompleted: bool
}

interface TaskRepository {
  +getTasksByDate(date): Future<List<Task>>
  +addTask(task): Future<void>
  +updateTask(task): Future<void>
  +deleteTask(id): Future<void>
}

class SqliteTaskRepository {
  -_database: Database
  +createDatabase(): Future<Database>
  -_taskToMap(task): Map
  -_mapRowToTask(row): Task
}

class TaskController {
  -_repository: TaskRepository
  +tasks: List<Task>
  +selectedDate: DateTime
  +loadTasks(date): Future<void>
  +addTask(task): Future<void>
  +toggleComplete(task): Future<void>
  +deleteTask(id): Future<void>
  +getDateStatus(date): DayStatus
}

class WeekController {
  +weekOffset: int
  +goToDate(date): void
  +currentWeekStart: DateTime
}

class SettingsModel {
  +themeMode: ThemeMode
  +fontFamily: String
  +accentColor: Color
  +init(): Future<void>
}

TaskRepository <|.. SqliteTaskRepository
TaskController --> TaskRepository
TaskController --> Task
WeekController --> Task : навигация по датам
@enduml
```

## Перечисление DayStatus

Используется в `TaskController.getDateStatus()`:

| Значение | Условие |
|----------|---------|
| `none` | Нет задач на дату |
| `active` | Есть невыполненные задачи |
| `completed` | Все задачи выполнены |
