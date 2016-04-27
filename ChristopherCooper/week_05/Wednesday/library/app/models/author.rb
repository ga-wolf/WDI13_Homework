# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :text
#  dob         :date
#  nationality :text
#  image       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Author < ActiveRecord::Base
  has_many  :books
end
