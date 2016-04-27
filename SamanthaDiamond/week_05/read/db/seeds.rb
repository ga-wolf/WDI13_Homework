Book.destroy_all
Book.create(:title => 'Shatter', :publication => '2008', :genre => 'psychological thriller', :image => 'http://covers.booktopia.com.au/big/9780751544473/shatter.jpg')

Author.destroy_all
Author.create(:name => 'Michael Robotham', :dob => '09/11/1960', :nationality => 'Australian')
