# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Author.destroy_all
Author.create(:name => 'Luigi Serafini', :nationality => 'Italian', :dob => '1949/08/04', :period => '20th century', :image => 'http://upload.wikimedia.org/wikipedia/commons/5/5c/Portrait_of_Joan_Miro%2C_Barcelona_1935_June_13.jpg')


Book.destroy_all
Book.create(:title => 'Codex Seraphinianus', :year => '1981', :genre => 'illustration', :image => 'http://41.media.tumblr.com/6b293aea7473596f536e145b957b2cd4/tumblr_mzrwc18h3b1qzu1hko1_1280.jpg')
