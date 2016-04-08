CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  genre TEXT,
  year_formed INTEGER,
  image TEXT,
  video TEXT
);

INSERT INTO musicians (name, genre, year_formed, image, video) VALUES ("U2", "Rock", 1976, "http://www.mojo4music.com/media/2014/11/U2-MOJO-254-770.jpg", "https://www.youtube.com/embed/GzZWSrr5wFI");
