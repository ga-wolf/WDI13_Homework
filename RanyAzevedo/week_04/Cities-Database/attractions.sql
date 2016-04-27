CREATE TABLE attractions(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  place TEXT,
  language TEXT,
  food TEXT,
  image TEXT
);

INSERT INTO attractions (place, language, food) VALUES ('Ipanema', 'Português', 'Feijoada');
