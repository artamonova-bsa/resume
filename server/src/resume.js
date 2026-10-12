import { pool } from './db.js';

// Собирает всё резюме из БД в один объект для фронтенда
export async function getResume() {
  const [profile, education, experience, stack, projects, skills, competencies, achievements] =
    await Promise.all([
      pool.query('SELECT * FROM profile ORDER BY id LIMIT 1'),
      pool.query('SELECT institution, program, period FROM education ORDER BY sort'),
      pool.query('SELECT id, name, url, role, kind, period, mentor, description FROM experience ORDER BY sort'),
      pool.query('SELECT experience_id, layer, items FROM experience_stack ORDER BY sort'),
      pool.query('SELECT name, url, description, stack FROM projects ORDER BY sort'),
      pool.query('SELECT name, items FROM skill_groups ORDER BY sort'),
      pool.query('SELECT name FROM competencies ORDER BY sort'),
      pool.query('SELECT title, year, kind, doc_url AS "docUrl" FROM achievements ORDER BY sort'),
    ]);

  const p = profile.rows[0];
  if (!p) return null;

  return {
    profile: {
      fullName: p.full_name,
      title: p.title,
      location: p.location,
      workFormat: p.work_format,
      email: p.email,
      github: p.github,
      summary: p.summary,
    },
    education: education.rows,
    experience: experience.rows.map(({ id, ...e }) => ({
      ...e,
      stack: stack.rows
        .filter((s) => s.experience_id === id)
        .map(({ layer, items }) => ({ layer, items })),
    })),
    projects: projects.rows,
    skills: skills.rows,
    competencies: competencies.rows.map((c) => c.name),
    achievements: achievements.rows,
  };
}
