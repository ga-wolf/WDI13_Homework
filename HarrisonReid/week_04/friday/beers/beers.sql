CREATE TABLE beers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  manufacturer TEXT,
  name TEXT,
  style TEXT,
  alcohol_content DECIMAL,
  image_url TEXT
);

INSERT INTO beers (manufacturer, name, style, alcohol_content, image_url) VALUES ("La Sirene", "Praline", "Belgian Chocolate Ale", 5.0, "http://static1.squarespace.com/static/53737436e4b02c5d204d668b/t/54bf3d38e4b0b7feacfb8c6f/1421819211437/Praline+Bottle.jpg?format=300w");

INSERT INTO beers (manufacturer, name, style, alcohol_content, image_url) VALUES ("Brewcult", "Milk and Two Sugars", "Imperial Milk Stout", 7.2, "https://craftybrew.com.au/content/images/thumbs/0001381_brewcult-milk-and-two-sugars_600.png");

INSERT INTO beers (manufacturer, name, style, alcohol_content, image_url) VALUES ("Quiet Deeds", "Vanilla Porter", "Porter", 6.2, "http://dnawpvd8dl079.cloudfront.net/image/qdvanilla.jpg");
