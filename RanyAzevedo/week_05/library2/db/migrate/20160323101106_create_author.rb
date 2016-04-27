class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
    t.text :name
    t.text :image
    t.date :dob
    t.text :genre
    t.text :awards
    t.timestamps
    end
  end
end
