# == Schema Information
#
# Table name: mountains
#
#  id      :integer          primary key
#  name    :text
#  country :text
#  range   :text
#  metres  :integer
#

class Mountain < ActiveRecord::Base
end
