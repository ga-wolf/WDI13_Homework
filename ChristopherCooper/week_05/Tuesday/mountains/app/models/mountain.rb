# == Schema Information
#
# Table name: mountains
#
#  id       :integer          primary key
#  name     :text
#  location :text
#  image    :text
#  height   :float
#  reached  :decimal(, )
#

class Mountain < ActiveRecord::Base
end
