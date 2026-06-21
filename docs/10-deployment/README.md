# Развёртывание

Клиентское Flutter-приложение; отдельный сервер не разворачивается.
Аутентификация — облачный Supabase.

## Android (APK)

### Требования

- Flutter SDK, Android SDK
- `flutter doctor` без критических ошибок

### Сборка release APK

```bash
flutter pub get
flutter build apk --release
```

**Результат:** `build/app/outputs/flutter-apk/app-release.apk` (~54 MB).

APK подписан debug-ключом (см. `android/app/build.gradle.kts`). Для публикации
в магазин нужна release-подпись.

### Установка на устройство

```bash
flutter install
```

или передать APK вручную (включить «Неизвестные источники»).

## Web

```bash
flutter build web --release
```

Артефакты: `build/web/`. Размещение на любом static hosting (GitHub Pages, Firebase Hosting).

## Windows

```bash
flutter build windows --release
```

Исполняемый файл: `build/windows/x64/runner/Release/`.

## Supabase (облако)

1. Проект создаётся в панели Supabase — отдельный деплой не требуется.
2. В `lib/main.dart` указать `url` и `anonKey` production-проекта.

## Переменные / конфигурация

| Параметр | Где задаётся | Назначение |
|----------|--------------|------------|
| Supabase URL | `lib/main.dart` | Адрес проекта |
| Supabase anon key | `lib/main.dart` | Публичный ключ клиента |
| Application ID | `android/app/build.gradle.kts` | `com.example.fly` |
| Version | `pubspec.yaml` | `1.0.0+1` |

## CI/CD (рекомендация)

```yaml
# Пример GitHub Actions
- run: flutter pub get
- run: flutter analyze
- run: flutter test
- run: flutter build apk --release
```

## GitHub

Репозиторий: [https://github.com/Said1809/FLY](https://github.com/Said1809/FLY)

Документация: каталог `docs/` в корне проекта.
