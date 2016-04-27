# == Schema Information
#
# Table name: mountains
#
#  id        :integer          primary key
#  country   :text
#  elevation :integer
#  type      :text
#  climbed   :text

class Mountain < ActiveRecord::Base
end
