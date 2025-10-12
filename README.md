# Docker compose php-apache + mysql
## Рекомендуется разворачивать в Unix-подобных ОС, в том числе WSL под Windows

## Что включает в себя данный docker compose:
- образ php 8.3 с веб-сервером Apache 2.4
- образ mysql 9.3
- образ phpmyadmin 5.2.1
- конфигурации к данным образам

## Начало работы:
### Для *WSL*:
- Установить полные права на папку `/src` командой - `chmod 777 src` (?)

## Общий список команд:
1. Первичная сборка приложения:
    - `docker compose build --no-cache`
    - `docker compose up -d --remove-orphans`
2. Остановить контейнеры:
    - `docker compose stop`
3. Запуск контейнеров:
    - `docker compose start`
4. Логи контейнеров:
    - `docker compose ps`
5. Пересобрать приложение:
    - `docker compose stop`
    - `docker compose pull`
    - `docker compose rm --force app`
    - `docker compose build --no-cache`
    - `docker compose up -d --force-recreate`
6. Удалить образы и контейнеры:
    - `docker compose down -v`
    - `docker compose down`
7. Интерактивный режим контейнера:
   - `docker compose exec --user root app /bin/bash`