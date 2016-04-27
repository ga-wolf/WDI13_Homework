Book.destroy_all
Book.create(:title => 'The Book Thief', :image => 'https://trailers.apple.com/trailers/fox/thebookthief/images/poster-large.jpg?lastmod=1', :writer => 'Markus Susaz', :genre => 'Novel-Historical Fiction', :year => 2006)

Author.destroy_all
Author.create(:name => 'Markus Susaz', :image => 'https://www.google.com.au/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwiTrYHFydbLAhUCj5QKHXg4CFsQjBwIBA&url=http%3A%2F%2Fphoto.goodreads.com%2Fauthors%2F1311632768p8%2F11466.jpg&psig=AFQjCNHOCJD-6MxFEZoOSQHd09xtHgqO1g&ust=1458814466692372', :dob => '10/02/1990', :genre => 'Young-adult fiction', :awards => 'Edwards Award')
