# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  title          :text
#  year_published :text
#  image          :text
#  summary        :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Book <ActiveRecord::Base
  belongs_to :Author
end
