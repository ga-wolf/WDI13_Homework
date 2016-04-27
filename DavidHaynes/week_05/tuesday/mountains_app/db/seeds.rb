# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Mountain.destroy_all

Mountain.create :name => "Everest", :height => 8848 , :elevation => 8848, :country => "Nepal", :country_other => "Tibet"
Mountain.create :name => "K2", :height => 4017  , :elevation => 8611, :country => "China", :country_other => "Pakistan"
Mountain.create :name => "Mauna Kea", :height => 10000 , :elevation => 4205, :country => "Mauna Kea"
Mountain.create :name => "Kilimanjaro", :height => 5885 , :elevation => 5895, :country => "Tanzania"
