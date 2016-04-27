CREATE TABLE cocktails(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  spirits TEXT,
  image TEXT
);

INSERT INTO cocktails (name, spirits) VALUES ("Old Fashioned", "Bourbon");
INSERT INTO cocktails (name, spirits) VALUES ("Margarita", "tequila,cointreau");
