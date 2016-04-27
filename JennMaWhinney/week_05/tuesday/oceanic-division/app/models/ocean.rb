# == Schema Information
#
# Table name: oceans
#
#  id     :integer          primary key
#  name   :text
#  image  :text
#  area   :integer
#  volume :integer
#  depth  :integer
#

class Ocean < ActiveRecord::Base
end
