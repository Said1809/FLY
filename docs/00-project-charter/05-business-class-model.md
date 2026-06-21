# Модель бизнес-классов

Концептуальная модель предметной области на бизнес-уровне (без технических деталей реализации).

```plantuml
@startuml
skinparam classAttributeIconSize 0

class User {
  +email: String
  --
  +register()
  +login()
  +logout()
}

class Task {
  +id: String
  +title: String
  +description: String
  +date: Date
  +time: Time?
  +isCompleted: Boolean
  --
  +markComplete()
  +markIncomplete()
}

class Week {
  +startDate: Date
  +days: Date[7]
  --
  +contains(date): Boolean
}

class UserSettings {
  +themeMode: ThemeMode
  +fontFamily: String
  +accentColor: Color
  --
  +applyTheme()
  +applyFont()
  +applyColor()
}

class DayStatus {
  +date: Date
  +status: DayStatusType
}

enum DayStatusType {
  none
  active
  completed
}

User "1" -- "0..*" Task : планирует >
User "1" -- "1" UserSettings : настраивает >
Week "1" -- "7" DayStatus : содержит >
Task "0..*" -- "1" DayStatus : определяет >
@enduml
```

## Описание классов

| Класс | Ответственность |
|-------|-----------------|
| **User** | Учётная запись и аутентификация (облако Supabase) |
| **Task** | Основная сущность планирования |
| **Week** | Представление недельного интервала для навигации |
| **UserSettings** | Персональные настройки интерфейса |
| **DayStatus** | Агрегированный статус дня по задачам |
