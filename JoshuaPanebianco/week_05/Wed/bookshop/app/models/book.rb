# == Schema Information
#
# Table name: books
#
#  id        :integer          not null, primary key
#  title     :text
#  image     :text
#  author_id :integer
#

class Book < ActiveRecord::Base
  belongs_to :author
end
