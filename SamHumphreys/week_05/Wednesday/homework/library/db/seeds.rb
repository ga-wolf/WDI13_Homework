# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.destroy_all
Author.create(:name => 'Stephen King', :image => 'http://nofilmschool.com/sites/default/files/styles/facebook/public/uploads/2013/07/Stephen-King.jpg?itok=8_53Aby0', :birthplace => 'Portland, Maine, United States', :residence => 'Maine, United States', :dob => '1947/09/21')

Book.destroy_all
Book.create(:title => 'Pet Semetary', :published => '1983', :edition => '3rd', :editionyear => '1987', :image => 'https://upload.wikimedia.org/wikipedia/en/5/52/StephenKingPetSematary.jpg')
