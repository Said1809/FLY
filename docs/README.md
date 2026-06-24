# Документация курсового проекта «Fly»

**Инструменты планирования и учебы** — кроссплатформенное приложение  
**Автор:** Хаджимухаметов Саид Керимович  
**СКФУ, 09.03.04 «Программная инженерия»**

Полный комплект проектной документации по этапам курсового проекта.

## Оглавление

| Этап | Раздел | Описание |
|------|--------|----------|
| 0 | [00-project-charter](00-project-charter/) | Инициация, паспорт проекта, SWOT, CJM |
| 1 | [01-requirements](01-requirements/) | Use Case, доменная модель, трассировка |
| 2 | [02-architecture](02-architecture/) | Слои, интерфейсы, ADR |
| 3 | [03-database](03-database/) | ER-диаграмма, DDL SQLite |
| 4 | [04-detailed-design](04-detailed-design/) | Sequence, class diagrams |
| 5 | [05-implementation](05-implementation/) | Реализация ядра |
| 6 | [06-testing](06-testing/) | Тестирование и анализ |
| 7 | [07-refactoring](07-refactoring/) | Repository, качество кода |
| 8 | [08-ui](08-ui/) | Flutter UI, экраны |
| 9 | [09-api](09-api/) | Supabase Auth |
| 10 | [10-deployment](10-deployment/) | Сборка APK, деплой |
| 11 | [11-user-guide](11-user-guide/) | Руководство пользователя |
| 12 | [12-final-report](12-final-report/) | ТЗ, WBS, Гант, COCOMO, пояснительная записка |

## Диаграммы проекта

Готовые PNG-диаграммы — в каталоге [`images/`](images/):

| Файл | Назначение |
|------|------------|
| `use_case.png` | Диаграмма прецедентов |
| `domain_model.png` | Доменная модель |
| `idef0_a0.png`, `idef0_decomp.png` | IDEF0 |
| `architecture.png` | Архитектура слоёв |
| `er_diagram.png` | ER-диаграмма |
| `sequence_login.png` | Sequence: вход |
| `gantt.png` | Диаграмма Ганта |

Скриншоты UI — в [`08-ui/screenshots/`](08-ui/screenshots/) (12 снимков реального приложения).

## Быстрые ссылки

- [Техническое задание](12-final-report/01-technical-specification.md)
- [Пояснительная записка](12-final-report/Пояснительная%20записка.docx)
- [Тестирование и покрытие (87,7 %)](06-testing/README.md)
- [Руководство пользователя](11-user-guide/01-user-manual.md)
- [Сборка APK](10-deployment/README.md)

## Репозиторий

https://github.com/Said1809/FLY
