// Создаёт таблицы и заливает данные резюме: npm run db:init
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { pool } from './db.js';

const dbDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../../db');
const files = fs.readdirSync(dbDir).filter((f) => f.endsWith('.sql')).sort();

try {
  for (const file of files) {
    await pool.query(fs.readFileSync(path.join(dbDir, file), 'utf8'));
    console.log(`✔ ${file}`);
  }
  console.log('База готова');
} catch (err) {
  console.error('Ошибка инициализации БД:', err.message);
  process.exitCode = 1;
} finally {
  await pool.end();
}
