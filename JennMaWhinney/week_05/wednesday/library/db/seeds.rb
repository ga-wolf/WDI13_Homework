Author.destroy_all
Author.create(:name => 'Virginia Woolf', :nationality => 'British', :dob => '1882/01/25', :image => 'http://www.librarising.com/astrology/celebs/images2/T-Z/virginiawoolf.jpg')

Book.destroy_all
Book.create(:title => 'Orlando', :year_published => '1928', :image => 'http://4.bp.blogspot.com/-8lWu6YalAGI/UcEX6MXFnLI/AAAAAAAAPaE/l-vJtVHPnm0/s1600/orlando.jpg', :summary => "A high-spirited romp inspired by the tumultuous family history of Woolf's partner, the aristocratic poet and novelist Vita Sackville-West. The book describes the adventures of a poet who changes sex from man to woman and lives for centuries, meeting the key figures of English literary history. ")
