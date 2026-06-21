# Диаграмма пакетов

![Архитектура слоёв](../images/architecture.png)

<details>
<summary>PlantUML (исходник)</summary>

```plantuml
@startuml
skinparam packageStyle rectangle

package "lib" {
  package "presentation" {
    [pages]
    [widgets]
    [dialogs]
  }
  package "controller" {
    [TaskController]
    [WeekController]
  }
  package "model" {
    [TaskRepository]
    [SqliteTaskRepository]
    [SettingsModel]
  }
  package "entity" {
    [Task]
    [Week]
  }
  package "services" {
    [AuthService]
  }
  package "framework" {
    [DateFormatter]
  }
  [main.dart]
  [constants.dart]
}

[presentation] --> [controller]
[controller] --> [model]
[controller] --> [entity]
[model] --> [entity]
[services] --> [entity]
[main.dart] --> [presentation]
[main.dart] --> [controller]
[main.dart] --> [model]
@enduml
```

</details>

## Структура каталогов

```
lib/
├── main.dart
├── constants.dart
└── src/
    ├── controller/
    ├── entity/
    ├── framework/
    ├── model/
    ├── presentation/
    │   ├── dialogs/
    │   ├── pages/
    │   └── widgets/
    └── services/
```
