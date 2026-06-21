# Этап 5. Реализация ядра

Артефакты этапа (Недели 11–12, вес 15%): исходный код приложения, статический анализ.

## Что реализовано

| Слой | Каталог | Классы |
|------|---------|--------|
| **Entity** | `entity/` | `Task`, `Week` |
| **Model** | `model/` | `TaskRepository`, `SqliteTaskRepository`, `InMemoryTaskRepository`, `SettingsModel`, `WeekCalculator` |
| **Control** | `controller/` | `TaskController`, `WeekController` |
| **Services** | `services/` | `AuthService` |
| **Foundation** | `framework/` | `DateFormatter` |
| **Presentation** | `presentation/` | 4 pages, 2 dialogs, 6 widgets |

## Ключевая логика

- **SqliteTaskRepository** — CRUD задач, сортировка по времени, маппинг Entity ↔ Row.
- **TaskController** — состояние списка задач, статусы дней для календаря.
- **WeekController** — смещение недель, переход к дате из месячного календаря.
- **SettingsModel** — персистентные настройки UI через SharedPreferences.
- **AuthGate** — маршрутизация по сессии Supabase.

## Объём кода

| Компонент | Строк (Dart, lib/) |
|-----------|-------------------|
| **Итого** | **≈ 1878** |

## Сборка и анализ

```bash
flutter pub get
flutter analyze
flutter build apk --release
```

APK: `build/app/outputs/flutter-apk/app-release.apk` (~54 MB).

## Зависимости (pubspec.yaml)

`provider`, `sqflite`, `supabase_flutter`, `shared_preferences`, `table_calendar`,
`intl`, `flutter_secure_storage`, `path`.
