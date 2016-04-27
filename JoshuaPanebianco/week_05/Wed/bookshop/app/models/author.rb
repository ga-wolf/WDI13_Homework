# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :text
#  nationality :text
#  dob         :date
#  created_at  :datetime
#  updated_at  :datetime
#  book_id     :integer
#

class Author < ActiveRecord::Base
  has_many :books
end
