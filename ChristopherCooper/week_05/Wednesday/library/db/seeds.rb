# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.destroy_all
Author.create(:name => 'Jules Verne', :dob => '1828/02/08', :nationality => 'French', :image => 'http://a4.files.biography.com/image/upload/c_fit,cs_srgb,dpr_1.0,h_1200,q_80,w_1200/MTE4MDAzNDEwNzEzNjc1Mjc4.jpg')

Book.destroy_all
Book.create(:title => 'Around the World in 80 Days', :year => '1873', :genre => 'Adventure novel', :publisher => 'Pierre-Jules Hetzel', :image => 'https://www.penguin.com.au/jpg-large/9780141035871.jpg')
