# Доменная модель (концептуальная)

![Доменная модель](../images/domain_model.png)

<details>
<summary>PlantUML (исходник)</summary>

```plantuml
@startuml
skinparam classAttributeIconSize 0

class Task <<entity>> {
  +id: String
  +title: String
  +description: String
  +date: DateTime
  +time: TimeOfDay?
  +isCompleted: bool
}

class Week <<entity>> {
  +startDate: DateTime
  +days: List<DateTime>
}

class TaskRepository <<interface>> {
  +getTasksByDate(date): List<Task>
  +addTask(task): void
  +updateTask(task): void
  +deleteTask(id): void
}

class TaskController <<control>> {
  -repository: TaskRepository
  +tasks: List<Task>
  +loadTasks(date): void
  +addTask(task): void
  +toggleComplete(task): void
  +deleteTask(id): void
  +getDateStatus(date): DayStatus
}

class SettingsModel <<control>> {
  +themeMode: ThemeMode
  +fontFamily: String
  +accentColor: Color
}

TaskController --> TaskRepository
TaskController --> Task
Week --> Task : группирует по дате
@enduml
```

</details>

## Инварианты домена

1. `Task.title` не может быть пустым при сохранении.
2. `Task.date` хранится без времени суток (только календарная дата).
3. `Task.time` опционально; задачи без времени сортируются после задач с временем.
4. `Task.id` уникален в пределах локальной БД.
