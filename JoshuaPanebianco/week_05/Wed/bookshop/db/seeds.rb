Book.destroy_all

Book.create(:title => 'Green Eggs And Ham', :image => 'https://hohcopelandwj.files.wordpress.com/2014/07/green-eggs-and-ham-1.jpg')

Book.create(:title => 'Witches', :image => 'http://d.gr-assets.com/books/1351707720l/6327.jpg')

Book.create(:title => 'Where The Wild Things Are', :image => 'http://www.vanillajoy.com/wp-content/uploads/2008/04/where-the-wild-things-are.jpg')

Author.destroy_all

Author.create(:name => 'Dr Seuss', :nationality => 'American', :dob => '1904/03/02')
