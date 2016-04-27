Author.destroy_all
Author.create(:name => "Ken Follet", :nationality => "British", :dob => '1949/06/05', :image => 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Ken_follet.jpg')

Book.destroy_all
Book.create(:title => "Fall of Giants", :year => '2010', :image => 'https://upload.wikimedia.org/wikipedia/en/thumb/e/ec/Fall_of_Giants.jpg/200px-Fall_of_Giants.jpg', :description => 'Ken Follett’s magnificent new historical epic begins, as five interrelated families move through the momentous dramas of the First World War, the Russian Revolution, and the struggle for women’s suffrage.')
