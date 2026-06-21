# ER-диаграмма (логическая модель)

![ER-диаграмма](../images/er_diagram.png)

<details>
<summary>PlantUML (исходник)</summary>

```plantuml
@startuml
entity "tasks" as tasks {
  * id : TEXT <<PK>>
  --
  * title : TEXT
  * description : TEXT
  * date : TEXT
  time_hour : INTEGER
  time_minute : INTEGER
  * is_completed : INTEGER
}
@enduml
```

</details>

## Описание сущности

| Сущность | Описание |
|----------|----------|
| **tasks** | Задачи пользователя с привязкой к календарной дате |

## Связи

В текущей версии MVP таблица `tasks` автономна (нет внешних ключей).
Привязка к пользователю Supabase не реализована на уровне БД.

## Настройки (вне ER-модели SQLite)

| Ключ SharedPreferences | Тип | Описание |
|------------------------|-----|----------|
| `theme_mode` | String | `light` / `dark` |
| `font_family` | String | Имя шрифта |
| `accent_color` | int | ARGB значение цвета |
