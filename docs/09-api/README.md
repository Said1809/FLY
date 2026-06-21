# Интеграция с Supabase Auth

В отличие от серверного REST API, приложение Fly использует **BaaS Supabase**
только для аутентификации. Задачи хранятся локально в SQLite.

## Инициализация

Файл: `lib/main.dart`

```dart
await Supabase.initialize(
  url: 'https://bfrtfolpiukgryyjiylr.supabase.co',
  anonKey: '<anon_key>',
);
```

## Операции аутентификации

| Операция | Метод SDK | UI-компонент | Назначение |
|----------|-----------|--------------|------------|
| Регистрация | `auth.signUp` | `AuthScreen` | Создание учётной записи |
| Вход | `auth.signInWithPassword` | `AuthScreen` | Получение сессии |
| Выход | `auth.signOut` | `SettingsPage` | Завершение сессии |
| Состояние | `onAuthStateChange` | `AuthGate` | Автопереход Home ↔ Auth |
| Текущая сессия | `auth.currentSession` | `AuthGate` | Проверка при старте |

## AuthService (обёртка)

Файл: `lib/src/services/auth_service.dart`

| Метод | Дополнительно |
|-------|---------------|
| `signUp` / `signIn` | Сохранение токенов в `FlutterSecureStorage` |
| `signOut` | `deleteAll()` в secure storage |

> UI в текущей версии вызывает SDK напрямую; `AuthService` готов для рефакторинга.

## Безопасность

- Пароли не хранятся локально — только токены сессии (при использовании AuthService).
- `anonKey` — публикуемый ключ клиента (RLS на стороне Supabase).
- Задачи **не** синхронизируются с Supabase DB — нет утечки локальных данных в облако.

## Поток данных

```
Клиент (Flutter)  ←→  Supabase Auth  (HTTPS)
       ↓
  SQLite (todo.db)     только локально
```

## Настройка проекта Supabase

1. Создать проект на [supabase.com](https://supabase.com).
2. Включить Email provider в Authentication.
3. Скопировать Project URL и anon key в `main.dart`.
4. (Опционально) Настроить подтверждение email в Auth settings.

## Обработка ошибок

| Ситуация | Поведение UI |
|----------|--------------|
| Неверный пароль | SnackBar с текстом ошибки |
| Email не подтверждён | Сообщение «Подтвердите почту» |
| Нет сети | Exception от SDK → SnackBar |
