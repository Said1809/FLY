# Спецификация ключевых методов

## TaskController.loadTasks

| | |
|---|---|
| **Назначение** | Загрузить задачи на выбранную дату |
| **Вход** | `DateTime date` |
| **Выход** | Обновление `tasks`, `notifyListeners()` |
| **Предусловия** | `_repository` инициализирован |
| **Постусловия** | `tasks` содержит актуальный список из БД |

---

## TaskController.toggleComplete

| | |
|---|---|
| **Назначение** | Инвертировать флаг выполнения задачи |
| **Вход** | `Task task` |
| **Алгоритм** | `task.copyWith(isCompleted: !task.isCompleted)` → `updateTask` → `loadTasks` |
| **Исключения** | — |

---

## TaskController.getDateStatus

| | |
|---|---|
| **Назначение** | Статус дня для календаря |
| **Вход** | `DateTime date` |
| **Выход** | `DayStatus` (none / active / completed) |
| **Алгоритм** | Загрузить задачи на дату; если пусто → none; если все completed → completed; иначе active |

---

## WeekController.goToDate

| | |
|---|---|
| **Назначение** | Перейти к неделе, содержащей указанную дату |
| **Вход** | `DateTime date` |
| **Алгоритм** | Вычислить разницу в неделях от «сегодня»; установить `weekOffset` |

---

## SqliteTaskRepository.createDatabase

| | |
|---|---|
| **Назначение** | Открыть/создать БД `todo.db` |
| **Выход** | `Future<Database>` |
| **onCreate** | Выполнить DDL таблицы `tasks` |
