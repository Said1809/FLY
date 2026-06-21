# Диаграмма зависимостей (ацикличность)

```plantuml
@startuml
skinparam componentStyle rectangle

component [Presentation] as P
component [Control] as C
component [Model] as M
component [Entity] as E
component [Foundation\nsqflite, supabase] as F

P --> C : Provider
C --> M
C --> E
M --> E
M --> F
P ..> E : read-only DTOs

note right of P
  Presentation не зависит
  от Foundation напрямую
end note
@enduml
```

## Правила зависимостей

1. Зависимости направлены **строго сверху вниз**.
2. `entity` не импортирует `presentation`, `controller`, `model`.
3. `TaskRepository` (интерфейс) объявлен в `model`; реализация SQLite — там же.
4. `main.dart` — composition root: создаёт БД, репозиторий, контроллеры, Provider.

## Проверка

```bash
flutter analyze
```

Нарушений циклических зависимостей между слоями не выявлено.
