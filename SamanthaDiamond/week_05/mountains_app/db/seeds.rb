# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mountain.destroy_all

Mountain.create :name => 'Mount Sinai', :country => 'Egypt', :elevation => 2285
Mountain.create :name => 'Todgha Gorge, High Atlas Mountains', :country => 'Morocco', :elevation => 1500
