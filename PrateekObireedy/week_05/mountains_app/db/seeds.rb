# CREATE TABLE mountains (
#   id INTEGER PRIMARY KEY AUTOINCREMENT,
#   name TEXT,
#   image TEXT,
#   location TEXT,
#   ascent TEXT,
#   height FLOAT
# );

Mountain.destroy_all

Mountain.create :name => "k2", :location => "Pakistan", :ascent => "Edmond Hillary", :height => 8404
Mountain.create :name => "k1", :location => "Australia", :ascent => "Hillary", :height => 200
Mountain.create :name => "k0", :location => "England", :ascent => "Homer Simpson", :height => 40000
