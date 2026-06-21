# Диаграмма системных прецедентов (Use Case)

![Диаграмма прецедентов](../images/use_case.png)

<details>
<summary>PlantUML (исходник)</summary>

```plantuml
@startuml
left to right direction
skinparam packageStyle rectangle
title Системные прецеденты: «Fly»

actor "Пользователь" as User
cloud "Supabase Auth" as Supa

rectangle "Система «Fly»" {
  usecase "UC1 Зарегистрироваться" as UC1
  usecase "UC2 Войти" as UC2
  usecase "UC3 Создать задачу" as UC3
  usecase "UC4 Просмотреть задачи\nна дату" as UC4
  usecase "UC5 Отметить выполнение" as UC5
  usecase "UC6 Удалить задачу" as UC6
  usecase "UC7 Навигация\nпо календарю" as UC7
  usecase "UC8 Настроить UI" as UC8
  usecase "UC9 Выйти" as UC9
}

User --> UC1
User --> UC2
User --> UC3
User --> UC4
User --> UC5
User --> UC6
User --> UC7
User --> UC8
User --> UC9

UC1 ..> Supa : signUp
UC2 ..> Supa : signInWithPassword
UC9 ..> Supa : signOut
UC3 ..> UC4 : <<include>>
UC5 ..> UC4 : <<extend>>
UC6 ..> UC4 : <<extend>>
@enduml
```

</details>

## Реестр прецедентов

| ID | Прецедент | Актор | Приоритет | Компонент |
|----|-----------|-------|:---------:|-----------|
| UC1 | Регистрация | Пользователь | High | `AuthScreen`, Supabase |
| UC2 | Вход | Пользователь | High | `AuthScreen`, `AuthGate` |
| UC3 | Создание задачи | Пользователь | High | `AddTaskPage`, `TaskController` |
| UC4 | Просмотр задач на дату | Пользователь | High | `HomePage`, `TaskCard` |
| UC5 | Отметка выполнения | Пользователь | High | `TaskCard`, `TaskController` |
| UC6 | Удаление задачи | Пользователь | Medium | `TaskDetailDialog` |
| UC7 | Навигация по календарю | Пользователь | High | `WeekPageView`, `TaskCalendarDialog` |
| UC8 | Настройка интерфейса | Пользователь | Medium | `SettingsPage`, `SettingsModel` |
| UC9 | Выход | Пользователь | Medium | `SettingsPage`, Supabase |
