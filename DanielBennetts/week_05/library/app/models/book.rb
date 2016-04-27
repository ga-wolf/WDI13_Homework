# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :text
#  year       :text
#  genre      :text
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Book < ActiveRecord::Base
end
