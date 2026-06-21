# Тестирование и покрытие

Модульное и виджетное тестирование на `flutter_test`, скриншоты UI — golden-тесты.

## Структура тестов

```
test/
├── controller/          # TaskController, WeekController
├── entity/              # Task, Week
├── framework/           # DateFormatter
├── model/               # Repository, SettingsModel, WeekCalculator
├── widget/              # HomePage, AddTaskPage, SettingsPage, диалоги
├── screenshot/          # Генерация скриншотов в docs/08-ui/screenshots/
└── helpers/             # test_app.dart, screenshot_helper.dart
```

## Тест-классы

| Файл | Что проверяет |
|------|---------------|
| `entity/task_test.dart` | Поля и значения по умолчанию `Task` |
| `entity/week_test.dart` | Семь дней недели с понедельника |
| `model/in_memory_task_repository_test.dart` | CRUD, сортировка по времени |
| `controller/task_controller_test.dart` | load/add/toggle/delete, статусы дней |
| `controller/week_controller_test.dart` | weekOffset, goToDate |
| `model/week_calculator_test.dart` | Текущая/соседние недели |
| `model/settings_model_test.dart` | Тема, шрифт, цвет, SharedPreferences |
| `framework/date_formatter_test.dart` | Форматирование дат (ru) |
| `widget/widget_test.dart` | Экраны, TaskCard, TaskDetailDialog |
| `screenshot/generate_screenshots_test.dart` | Golden-скриншоты UI |

## Запуск

```bash
flutter test                                    # все тесты
flutter test --coverage                         # с отчётом покрытия
flutter test test/screenshot/generate_screenshots_test.dart --update-goldens
```

## Скриншоты

Golden-файлы сохраняются в `docs/08-ui/screenshots/` (реальные скриншоты приложения):

| Файл | Экран |
|------|-------|
| `01-auth-login.png` | Вход |
| `02-auth-register.png` | Регистрация |
| `03-home-day.png` | Главная (одна задача) |
| `04-calendar.png` | Месячный календарь |
| `05-add-task.png` | Создание задачи |
| `06-add-task-date-picker.png` | Выбор даты |
| `07-add-task-time-picker.png` | Выбор времени |
| `08-home-tasks-list.png` | Список задач |
| `09-home-completed.png` | Завершённые задачи |
| `10-settings-theme.png` | Настройка темы |
| `11-settings-font.png` | Настройка шрифта |
| `12-settings-color.png` | Настройка цвета |

Исходные файлы: `C:\Users\Said\KURSACH 3\приложение`.

## Результаты

| Метрика | Значение |
|---------|----------|
| Тестовых файлов | 10 |
| Тест-кейсов | 32+ |
| Покрытие (model/controller/entity) | Основная бизнес-логика покрыта |

Для детального отчёта покрытия:

```bash
flutter test --coverage
# отчёт: coverage/lcov.info
```
