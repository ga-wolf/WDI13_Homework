CREATE TABLE activities (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  people INTEGER,
  equipment TEXT,
  risk TEXT,
  image TEXT
);

INSERT INTO activities (name, people, equipment) VALUES ('cycling', '1', 'bicycle, helmet');
