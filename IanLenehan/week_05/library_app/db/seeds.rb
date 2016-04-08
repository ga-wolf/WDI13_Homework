Author.destroy_all
Author.create(:name => 'Michael Crichton', :nationality => 'American', :dob => '1942/10/23', :image => 'http://latimesblogs.latimes.com/.a/6a00d8341c630a53ef01310f637354970c-500wi')

Book.destroy_all
Book.create(:title => 'Jurassic Park', :year => '1990', :genre => 'Techno-thriller', :cover => 'https://upload.wikimedia.org/wikipedia/en/3/33/Jurassicpark.jpg')
