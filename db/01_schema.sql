-- Схема данных сайта-резюме

CREATE TABLE IF NOT EXISTS profile (
  id          SERIAL PRIMARY KEY,
  full_name   TEXT NOT NULL,
  title       TEXT NOT NULL,
  location    TEXT,
  work_format TEXT,
  email       TEXT,
  github      TEXT,
  summary     TEXT
);

CREATE TABLE IF NOT EXISTS education (
  id          SERIAL PRIMARY KEY,
  institution TEXT NOT NULL,
  program     TEXT NOT NULL,
  period      TEXT,
  sort        INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS experience (
  id          SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  url         TEXT,
  role        TEXT NOT NULL,
  kind        TEXT,
  period      TEXT,
  mentor      TEXT,
  description TEXT,
  sort        INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS experience_stack (
  id            SERIAL PRIMARY KEY,
  experience_id INT NOT NULL REFERENCES experience(id) ON DELETE CASCADE,
  layer         TEXT NOT NULL,
  items         TEXT[] NOT NULL,
  sort          INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS projects (
  id          SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  url         TEXT,
  description TEXT,
  stack       TEXT[] NOT NULL DEFAULT '{}',
  sort        INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS skill_groups (
  id    SERIAL PRIMARY KEY,
  name  TEXT NOT NULL,
  items TEXT[] NOT NULL,
  sort  INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS competencies (
  id   SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  sort INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS achievements (
  id      SERIAL PRIMARY KEY,
  title   TEXT NOT NULL,
  year    INT,
  kind    TEXT NOT NULL DEFAULT 'diploma', -- diploma | certificate
  doc_url TEXT,
  sort    INT NOT NULL DEFAULT 0
);
