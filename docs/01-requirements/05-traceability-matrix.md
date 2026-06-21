# Матрица трассировки

Связь требований, прецедентов, компонентов и тестов.

| ID требования | Описание | UC | Компонент | Статус |
|---------------|----------|-----|-----------|--------|
| FR-01 | Регистрация пользователя | UC1 | `AuthScreen` | ✅ Реализовано |
| FR-02 | Вход по email/password | UC2 | `AuthScreen`, `AuthGate` | ✅ Реализовано |
| FR-03 | Создание задачи | UC3 | `AddTaskPage`, `TaskController` | ✅ Реализовано |
| FR-04 | Просмотр задач на дату | UC4 | `HomePage`, `TaskCard` | ✅ Реализовано |
| FR-05 | Отметка выполнения | UC5 | `TaskController.toggleComplete` | ✅ Реализовано |
| FR-06 | Удаление задачи | UC6 | `TaskDetailDialog` | ✅ Реализовано |
| FR-07 | Недельная навигация | UC7 | `WeekPageView`, `WeekController` | ✅ Реализовано |
| FR-08 | Месячный календарь | UC7 | `TaskCalendarDialog` | ✅ Реализовано |
| FR-09 | Настройка темы | UC8 | `SettingsModel.setThemeMode` | ✅ Реализовано |
| FR-10 | Настройка шрифта | UC8 | `SettingsModel.setFontFamily` | ✅ Реализовано |
| FR-11 | Настройка цвета | UC8 | `SettingsModel.setAccentColor` | ✅ Реализовано |
| FR-12 | Выход из системы | UC9 | `SettingsPage` | ✅ Реализовано |
| NFR-01 | Локальное хранение (офлайн) | — | `SqliteTaskRepository` | ✅ Реализовано |
| NFR-02 | Русская локализация | — | `intl`, `flutter_localizations` | ✅ Реализовано |
| NFR-03 | Покрытие тестами > 40% | — | `test/` | ✅ Реализовано (32 теста) |
