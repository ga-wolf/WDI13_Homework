# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ocean.destroy_all

Ocean.create :name => 'Pacific', :seas => 'Coral Sea, Tasman Sea', :depth => 10911, :salinity => 37
Ocean.create :name => 'Indian', :seas => 'Red Sea, Persian Gulf', :depth => 7906, :salinity => 37
