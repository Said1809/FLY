# Спецификация интерфейсов

## TaskRepository

```dart
abstract class TaskRepository {
  Future<List<Task>> getTasksByDate(DateTime date);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}
```

| Метод | Вход | Выход | Описание |
|-------|------|-------|----------|
| `getTasksByDate` | `DateTime date` | `List<Task>` | Задачи на дату, сортировка по времени |
| `addTask` | `Task task` | — | INSERT в таблицу `tasks` |
| `updateTask` | `Task task` | — | UPDATE по `id` |
| `deleteTask` | `String id` | — | DELETE по `id` |

**Реализации:** `SqliteTaskRepository` (production), `InMemoryTaskRepository` (тесты).

---

## AuthService

```dart
class AuthService {
  Future<bool> isLoggedIn();
  Future<AuthResponse> signUp(String email, String password);
  Future<AuthResponse> signIn(String email, String password);
  Future<void> signOut();
}
```

| Метод | Описание |
|-------|----------|
| `signUp` | Регистрация через Supabase; сохранение токенов в Secure Storage |
| `signIn` | Вход; сохранение сессии |
| `signOut` | Выход; очистка Secure Storage |

> **Примечание:** UI (`AuthScreen`, `SettingsPage`) в текущей версии обращается к Supabase SDK напрямую; `AuthService` подготовлен для унификации.

---

## SettingsModel (публичный API)

| Свойство / метод | Тип | Описание |
|------------------|-----|----------|
| `themeMode` | `ThemeMode` | Светлая / тёмная тема |
| `fontFamily` | `String` | Семейство шрифта |
| `accentColor` | `Color` | Акцентный цвет Material 3 |
| `init()` | — | Загрузка из SharedPreferences |
| `setThemeMode` | `ThemeMode` | Сохранение темы |
| `setFontFamily` | `String` | Сохранение шрифта |
| `setAccentColor` | `Color` | Сохранение цвета |
