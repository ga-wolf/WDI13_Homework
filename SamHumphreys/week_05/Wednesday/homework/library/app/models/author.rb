# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :text
#  image      :text
#  birthplace :text
#  residence  :text
#  dob        :date
#  created_at :datetime
#  updated_at :datetime
#

class Author < ActiveRecord::Base
  has_many :books
end
