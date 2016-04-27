# CREATE TABLE mountains(
#   id INTEGER PRIMARY KEY AUTOINCREMENT,
#   name TEXT,
#   location TEXT,
#   image TEXT,
#   height FLOAT,
#   reached TEXT
#   year NUMBER
# );



Mountain.create :name => 'Mt. Everest', :location => "Nepal"
Mountain.create :name => 'Chimborazo', :location => "Ecuador"
Mountain.create :name => 'Aiguille du Dru', :location => "France"
