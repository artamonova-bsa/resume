# Резюме — Алиса Артамонова

Сайт-резюме на **Node.js (Express) + React (Vite) + PostgreSQL**.
Все данные резюме хранятся в БД и отдаются фронтенду через `GET /api/resume`.

## Структура

```
db/        SQL: схема (01_schema.sql) и данные резюме (02_seed.sql)
server/    Express API + раздача собранного фронтенда
client/    React-приложение (Vite)
```

## Быстрый старт через Docker

```bash
docker compose up -d --build
# http://localhost:3000
```

При первом запуске PostgreSQL сам применит файлы из `db/`.
Чтобы перезалить данные после правок в `02_seed.sql`: `docker compose down -v && docker compose up -d --build`.

## Локальная разработка

Нужны Node.js 20+ и PostgreSQL.

```bash
npm run install:all
cp server/.env.example server/.env   # укажите доступ к PostgreSQL
createdb resume
npm run db:init                      # таблицы + данные

npm run dev:server                   # API на :3000
npm run dev:client                   # фронтенд на :5173 (проксирует /api)
```

Продакшн-сборка без Docker: `npm run build && npm start`.

## Как обновить резюме

Отредактируйте `db/02_seed.sql` и выполните `npm run db:init` — файл сначала очищает таблицы, потом заливает данные заново.

## API

| Метод | Путь | Описание |
|-------|------|----------|
| GET | `/api/resume` | Всё резюме одним JSON |
| GET | `/api/health` | Проверка сервера и БД |

Кнопка «Скачать PDF» на странице открывает печать с отдельными стилями для бумаги.
