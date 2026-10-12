-- Данные резюме (источник: github.com/artamonova-bsa — portfolio, achievements и репозитории проектов)

TRUNCATE profile, education, experience, experience_stack, projects,
         skill_groups, competencies, achievements RESTART IDENTITY CASCADE;

INSERT INTO profile (full_name, title, location, work_format, email, github, summary) VALUES (
  'Алиса Артамонова',
  'Системный и бизнес-аналитик · Fullstack-разработчик',
  'Уфа, Россия',
  'Открыта к удалённой работе',
  'alisa.artamonova.bsa@gmail.com',
  'https://github.com/artamonova-bsa',
  'Аналитик с опытом fullstack-разработки: от сбора требований и BPMN/UML до продакшн-деплоя на Node.js, React и PostgreSQL. Создала EdTech-стартап Mentors (топ-5 акселератора УГНТУ 2026) и разрабатываю платформу профориентации UniVerse под наставничеством Газпромнефть-Цифровые решения.'
);

INSERT INTO education (institution, program, period, sort) VALUES
  ('УГНТУ', 'Бакалавриат «Цифровые технологии в экономике и управлении»', '2026', 1),
  ('Школа 21 (Сбер)', 'Трек «Бизнес- и системный аналитик» — пройдены все базовые модули', NULL, 2);

INSERT INTO experience (name, url, role, kind, period, mentor, description, sort) VALUES
  ('UniVerse — платформа профориентации УГНТУ', NULL,
   'Разработчик в команде', 'Грантовый проект', '2025 — н.в.', 'Газпромнефть-ЦР',
   'Веб-платформа для абитуриентов: запись на мероприятия, QR-отметка посещаемости, система баллов, аналитика и экспорт в Excel для приёмной комиссии. Деплой в Kubernetes.', 1),
  ('Mentors — маркетплейс репетиторских услуг', 'https://edu-mentors.ru',
   'Fullstack-разработчик', 'Стартап', '2025 — 2026', NULL,
   'SaaS-платформа с AI-подбором преподавателей на XGBoost, эскроу-платежами ЮKassa и RAG-генерацией домашних заданий через LangChain и GigaChat. CI/CD, продакшн на VPS.', 2);

INSERT INTO experience_stack (experience_id, layer, items, sort) VALUES
  (1, 'Backend',    ARRAY['Node.js','Express','PostgreSQL','Sequelize','JWT','Swagger','Jest'], 1),
  (1, 'Frontend',   ARRAY['Vue 3','Vite','Bootstrap 5','Chart.js'], 2),
  (1, 'DevOps',     ARRAY['Docker','Kubernetes','Nginx'], 3),
  (1, 'Интеграции', ARRAY['DaData','QR-коды','Excel-экспорт','RSS-парсинг','SMTP'], 4),
  (2, 'Backend',    ARRAY['Node.js','Express','PostgreSQL','Socket.io','JWT','Swagger'], 1),
  (2, 'Frontend',   ARRAY['React','Nginx'], 2),
  (2, 'ML',         ARRAY['Python','FastAPI','XGBoost','LangChain','ChromaDB','GigaChat'], 3),
  (2, 'DevOps',     ARRAY['Docker Compose','GitHub Actions CI/CD','VPS Ubuntu 24.04'], 4),
  (2, 'Интеграции', ARRAY['ЮKassa (эскроу)','Jitsi Meet','DaData','SMTP'], 5);

INSERT INTO projects (name, url, description, stack, sort) VALUES
  ('Bashkortostan Parser', 'https://github.com/artamonova-bsa/bashkortostan-parser',
   'Парсер районов, населённых пунктов и школ Башкортостана из Википедии и открытых источников с загрузкой в PostgreSQL. Параллельный сбор (master + worker), валидация данных. Источник данных для UniVerse.',
   ARRAY['Node.js','Sequelize','PostgreSQL','Cheerio','Axios','Mocha'], 1),
  ('KDM Bot', 'https://github.com/artamonova-bsa/kdm-bot',
   'Telegram-бот для навигации по кружкам и педагогам культурных центров Уфы: списки кружков, контакты педагогов, геолокация, запись через администратора.',
   ARRAY['Python','pyTelegramBotAPI','openpyxl','Docker'], 2);

INSERT INTO skill_groups (name, items, sort) VALUES
  ('Backend',      ARRAY['Node.js','Express','Python','FastAPI'], 1),
  ('Frontend',     ARRAY['React','Vue 3'], 2),
  ('База данных',  ARRAY['PostgreSQL','SQL','Sequelize'], 3),
  ('ML / AI',      ARRAY['XGBoost','LangChain','ChromaDB'], 4),
  ('DevOps',       ARRAY['Docker','Kubernetes','GitHub Actions','Nginx'], 5),
  ('BA / SA',      ARRAY['BPMN','UML','Figma','Draw.io'], 6);

INSERT INTO competencies (name, sort) VALUES
  ('Декомпозиция задачи', 1),
  ('Анализ стейкхолдеров', 2),
  ('Методы сбора и управления требованиями', 3),
  ('Доменное моделирование', 4),
  ('UML-диаграммы, BPMN-процессы', 5),
  ('User Story, Use Case', 6),
  ('Объекты и роли, функциональные требования', 7),
  ('Проектирование пользовательских интерфейсов', 8);

INSERT INTO achievements (title, year, kind, doc_url, sort) VALUES
  ('Победитель олимпиады УГНТУ «Информационные технологии»', 2026, 'diploma', NULL, 1),
  ('Топ-5 акселератора УГНТУ — ВКР защищена как стартап', 2026, 'diploma',
   'https://github.com/artamonova-bsa/achievements/blob/master/certificates/%D0%A1%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%20%D0%90%D0%BA%D1%81%D0%B5%D0%BB%D0%B5%D1%80%D0%B0%D1%82%D0%BE%D1%80%202026%20%D0%A2%D0%BE%D0%BF-5.pdf', 2),
  ('Акселератор УГНТУ 2025', 2025, 'diploma',
   'https://github.com/artamonova-bsa/achievements/blob/master/diplomas/%D0%94%D0%B8%D0%BF%D0%BB%D0%BE%D0%BC%20%D0%90%D0%BA%D1%81%D0%B5%D0%BB%D0%B5%D1%80%D0%B0%D1%82%D0%BE%D1%80%202025.pdf', 3),
  ('Диплом НИРС Газпромнефть — за научно-исследовательскую работу', NULL, 'diploma',
   'https://github.com/artamonova-bsa/achievements/blob/master/diplomas/%D0%94%D0%B8%D0%BF%D0%BB%D0%BE%D0%BC%20%D0%9D%D0%98%D0%A0%D0%A1%20%D0%B3%D0%B0%D0%B7%D0%BF%D1%80%D0%BE%D0%BC.pdf', 4),
  ('Диплом хакатона Газпромнефть', NULL, 'diploma',
   'https://github.com/artamonova-bsa/achievements/blob/master/diplomas/%D0%94%D0%B8%D0%BF%D0%BB%D0%BE%D0%BC%20%D0%A5%D0%B0%D0%BA%D0%B0%D1%82%D0%BE%D0%BD%20%D0%B3%D0%B0%D0%B7%D0%BF%D1%80%D0%BE%D0%BC.pdf', 5),
  ('Stepik — Базы данных и SQL', NULL, 'certificate',
   'https://github.com/artamonova-bsa/achievements/blob/master/certificates/%D0%A1%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%20%D0%A1%D1%82%D0%B5%D0%BF%D0%B8%D0%BA%20SQL.pdf', 6),
  ('Stepik — Алгоритмы и структуры данных', NULL, 'certificate',
   'https://github.com/artamonova-bsa/achievements/blob/master/certificates/%D0%A1%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%20%D0%A1%D1%82%D0%B5%D0%BF%D0%B8%D0%BA%20%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%D1%8B.pdf', 7),
  ('Stepik — Операционные системы', NULL, 'certificate',
   'https://github.com/artamonova-bsa/achievements/blob/master/certificates/%D0%A1%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%20%D0%A1%D1%82%D0%B5%D0%BF%D0%B8%D0%BA%20%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%B5%20%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B.pdf', 8);
