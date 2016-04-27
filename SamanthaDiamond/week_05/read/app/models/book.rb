# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :text
#  publication :date
#  genre       :text
#  image       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Book < ActiveRecord::Base
end
