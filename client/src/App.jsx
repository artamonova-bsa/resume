import { useEffect, useState } from 'react';

function Section({ id, title, children }) {
  return (
    <section className="section" id={id}>
      <h2 className="section__title">{title}</h2>
      <div className="section__body">{children}</div>
    </section>
  );
}

function Tags({ items }) {
  return (
    <ul className="tags">
      {items.map((t) => (
        <li key={t} className="tag">{t}</li>
      ))}
    </ul>
  );
}

function ExternalLink({ href, children }) {
  return (
    <a href={href} target="_blank" rel="noreferrer">
      {children}
    </a>
  );
}

export default function App() {
  const [data, setData] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('/api/resume')
      .then((r) => (r.ok ? r.json() : Promise.reject(new Error(`HTTP ${r.status}`))))
      .then(setData)
      .catch((e) => setError(e.message));
  }, []);

  if (error) return <div className="state">Не удалось загрузить резюме: {error}</div>;
  if (!data) return <div className="state">Загрузка…</div>;

  const { profile, education, experience, projects, skills, competencies, achievements } = data;
  const githubName = profile.github?.replace(/^https?:\/\/github\.com\//, '');

  return (
    <div className="page">
      <header className="hero">
        <p className="hero__eyebrow">Резюме</p>
        <h1 className="hero__name">{profile.fullName}</h1>
        <p className="hero__title">{profile.title}</p>
        <ul className="hero__meta">
          <li>{profile.location}</li>
          <li>{profile.workFormat}</li>
          {profile.email && <li><a href={`mailto:${profile.email}`}>{profile.email}</a></li>}
          {profile.github && <li><ExternalLink href={profile.github}>github.com/{githubName}</ExternalLink></li>}
        </ul>
        <div className="hero__actions">
          {profile.email && <a className="btn btn--primary" href={`mailto:${profile.email}`}>Написать</a>}
          <button className="btn" onClick={() => window.print()}>Скачать PDF</button>
        </div>
      </header>

      <main>
        <Section id="about" title="О себе">
          <p className="lead">{profile.summary}</p>
        </Section>

        <Section id="experience" title="Опыт">
          {experience.map((e) => (
            <article className="job" key={e.name}>
              <div className="job__head">
                <h3 className="job__name">
                  {e.url ? <ExternalLink href={e.url}>{e.name}</ExternalLink> : e.name}
                </h3>
                <span className="job__period">{e.period}</span>
              </div>
              <p className="job__role">
                {[e.role, e.kind, e.mentor && `наставник: ${e.mentor}`].filter(Boolean).join(' · ')}
              </p>
              <p>{e.description}</p>
              <dl className="stack">
                {e.stack.map((s) => (
                  <div className="stack__row" key={s.layer}>
                    <dt>{s.layer}</dt>
                    <dd>{s.items.join(' · ')}</dd>
                  </div>
                ))}
              </dl>
            </article>
          ))}
        </Section>

        <Section id="projects" title="Проекты">
          <div className="cards">
            {projects.map((p) => (
              <article className="card" key={p.name}>
                <h3 className="card__title">
                  {p.url ? <ExternalLink href={p.url}>{p.name}</ExternalLink> : p.name}
                </h3>
                <p>{p.description}</p>
                <Tags items={p.stack} />
              </article>
            ))}
          </div>
        </Section>

        <Section id="skills" title="Технологии">
          <dl className="skills">
            {skills.map((g) => (
              <div className="skills__row" key={g.name}>
                <dt>{g.name}</dt>
                <dd><Tags items={g.items} /></dd>
              </div>
            ))}
          </dl>
        </Section>

        <Section id="analysis" title="Аналитика">
          <p className="muted">Школа 21 (Сбер), трек SA/BA — пройдены все базовые модули:</p>
          <ul className="checklist">
            {competencies.map((c) => <li key={c}>{c}</li>)}
          </ul>
        </Section>

        <Section id="education" title="Образование">
          {education.map((e) => (
            <div className="edu" key={e.institution}>
              <div className="job__head">
                <h3 className="job__name">{e.institution}</h3>
                {e.period && <span className="job__period">{e.period}</span>}
              </div>
              <p>{e.program}</p>
            </div>
          ))}
        </Section>

        <Section id="achievements" title="Достижения">
          <ul className="awards">
            {achievements.map((a) => (
              <li key={a.title} className={`award award--${a.kind}`}>
                <span className="award__year">{a.year ?? ''}</span>
                <span className="award__title">
                  {a.docUrl ? <ExternalLink href={a.docUrl}>{a.title}</ExternalLink> : a.title}
                </span>
              </li>
            ))}
          </ul>
        </Section>
      </main>

      <footer className="footer">
        Node.js · React · PostgreSQL — <ExternalLink href={profile.github}>исходный код на GitHub</ExternalLink>
      </footer>
    </div>
  );
}
