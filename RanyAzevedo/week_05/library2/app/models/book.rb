# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :text
#  image      :text
#  writer     :text
#  genre      :text
#  year       :integer
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer
#

class Book < ActiveRecord::Base
  belongs_to :author
end
