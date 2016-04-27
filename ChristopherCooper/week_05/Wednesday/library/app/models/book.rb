# == Schema Information
#
# Table name: books
#
#  id        :integer          not null, primary key
#  title     :text
#  year      :text
#  genre     :text
#  publisher :text
#  image     :text
#  author_id :integer
#

class Book < ActiveRecord::Base
  belongs_to :author
end
