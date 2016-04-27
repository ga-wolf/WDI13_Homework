Author.destroy_all
Author.create(:name => 'Andrzej Sapkowski', :nationality => 'Polish', :dob => '1948/06/21', :image => 'http://selkar.pl/img/uploads/Andrzej_Sapkowski.jpg')

Book.destroy_all
Book.create(:title => 'The Last Wish', :year => '1993', :genre => 'Fantasy', :image => 'http://www.librariaeminescu.ro/upload/produse/Andrzej-Sapkowski__The-Last-Wish__0-575-08244-1-785334291225.jpg')
