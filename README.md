# Инструменты планирования и учебы — кроссплатформенное приложение Fly

Курсовой проект по дисциплине «Программная инженерия» (СКФУ, 09.03.04).
**Автор:** Хаджимухаметов Саид Керимович
**Траектория:** кроссплатформенная разработка (Flutter + Supabase Auth + SQLite).

Клиентское приложение для персонального и учебного планирования: создание задач
с привязкой к дате и времени, **недельный** и **месячный календарь**, отметка
выполнения, **персонализация интерфейса** (тема, шрифт, цвет). Данные задач
хранятся локально в SQLite; аутентификация пользователя выполняется через
облачный сервис Supabase.

## Архитектура

Проект построен на **многослойной архитектуре** с направленностью зависимостей
строго сверху вниз и паттерном **Repository** для доступа к данным.


| Слой         | Реализация                                                     |
| ------------ | -------------------------------------------------------------- |
| Presentation | Flutter-виджеты и экраны (`pages`, `widgets`, `dialogs`)       |
| Control      | `TaskController`, `WeekController` (ChangeNotifier + Provider) |
| Model        | `TaskRepository`, `SqliteTaskRepository`, `SettingsModel`      |
| Entity       | `Task`, `Week` (доменные объекты)                              |
| Foundation   | SQLite (`sqflite`), `AuthService`, `DateFormatter`             |


## Технологический стек

- **Клиент:** Dart 3, Flutter, Material Design 3, Provider
- **Локальная БД:** SQLite через `sqflite` (таблица `tasks`)
- **Аутентификация:** Supabase Auth (email/password), `flutter_secure_storage`
- **Календарь:** `table_calendar`, локализация `intl` (ru)
- **Настройки:** `shared_preferences` (тема, шрифт, акцентный цвет)
- **Платформы:** Android, Web, Windows, iOS, Linux, macOS
- **Тесты:** `flutter_test`, `flutter_lints`

## Структура репозитория

```
.
├── lib/
│   ├── main.dart                    # Точка входа, AuthGate, MultiProvider
│   ├── constants.dart               # Цвета и константы UI
│   └── src/
│       ├── controller/              # TaskController, WeekController
│       ├── entity/                  # Task, Week
│       ├── framework/               # DateFormatter и вспомогательные утилиты
│       ├── model/                   # Repository, SQLite, SettingsModel
│       ├── presentation/
│       │   ├── pages/               # HomePage, AuthScreen, AddTaskPage, SettingsPage
│       │   ├── widgets/             # TaskCard, WeekPageView, DateHeader
│       │   └── dialogs/             # TaskCalendarDialog, TaskDetailDialog
│       └── services/                # AuthService (Supabase)
├── android/                         # Сборка Android APK
├── web/                             # Сборка веб-версии
├── windows/                         # Сборка Windows-приложения
├── test/                            # Модульные и виджетные тесты
└── fonts/                           # Roboto, Impact, Saxonia Antiqua
```

## Данные и предметная область

Задачи хранятся в локальной базе `todo.db` (SQLite). Каждая запись содержит
идентификатор, название, описание, дату, время (опционально) и флаг выполнения.
Репозиторий `SqliteTaskRepository` реализует интерфейс `TaskRepository` и
обеспечивает CRUD-операции, фильтрацию по дате и сортировку по времени.

Недельное представление (`WeekPageView`) показывает статус дней: активные задачи,
все выполнены или задач нет. Месячный календарь (`TaskCalendarDialog`) позволяет
быстро перейти к произвольной дате.

Учётная запись пользователя создаётся и проверяется на стороне Supabase Auth;
сессия сохраняется в защищённом хранилище устройства.

## Запуск

### Требования

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart ^3.10)
- Для Android: Android SDK; для Web: Chrome; для Windows: Visual Studio Build Tools

Проверка окружения:

```bash
flutter doctor
```

### Установка зависимостей

```bash
flutter pub get
```

Перед первым запуском убедитесь, что в `lib/main.dart` указаны корректные
`url` и `anonKey` вашего проекта Supabase.

### Режим разработки

```bash
flutter run                  # устройство по умолчанию
flutter run -d chrome        # веб-версия
flutter run -d windows       # Windows
flutter run -d <device_id>     # конкретное Android-устройство / эмулятор
```

Список доступных устройств:

```bash
flutter devices
```

### Сборка релизных артефактов

```bash
flutter build apk --release          # Android APK
flutter build web --release          # веб (каталог build/web)
flutter build windows --release      # Windows (.exe)
```

APK после сборки: `build/app/outputs/flutter-apk/app-release.apk`.

## Функциональность


| Раздел         | Возможности                            | Компонент                            |
| -------------- | -------------------------------------- | ------------------------------------ |
| Аутентификация | Вход, регистрация, выход               | `AuthScreen`, `AuthService`          |
| Задачи         | Создание, просмотр, отметка выполнения | `AddTaskPage`, `TaskCard`            |
| Календарь      | Недельная и месячная навигация         | `WeekPageView`, `TaskCalendarDialog` |
| Настройки      | Тема, шрифт, основной цвет             | `SettingsPage`, `SettingsModel`      |
| Хранение       | Локальная БД, офлайн-доступ            | `SqliteTaskRepository`               |


## Аутентификация (Supabase)

Приложение использует Supabase Auth для регистрации и входа по email/password.
Основные операции:


| Операция    | Метод SDK                 | Назначение                        |
| ----------- | ------------------------- | --------------------------------- |
| Регистрация | `auth.signUp`             | Создание учётной записи           |
| Вход        | `auth.signInWithPassword` | Получение сессии                  |
| Выход       | `auth.signOut`            | Завершение сессии                 |
| Состояние   | `onAuthStateChange`       | Маршрутизация AuthGate → HomePage |


Данные задач не синхронизируются с облаком и остаются на устройстве пользователя.

## Тестирование

```bash
flutter test                         # все тесты (25)
flutter test --coverage              # отчёт покрытия (coverage/lcov.info)
flutter analyze                      # статический анализ (flutter_lints)
```

Покрытие бизнес-логики: **87,7 %** (порог методички > 40 %). Подробности и
`lcov.info` для сдачи — в [docs/06-testing](docs/06-testing/README.md).

## Документация

Полный комплект курсового проекта (этапы 00–12), диаграммы, скриншоты,
[пояснительная записка](docs/12-final-report/Пояснительная%20записка.docx) —
в каталоге [docs/](docs/README.md).

