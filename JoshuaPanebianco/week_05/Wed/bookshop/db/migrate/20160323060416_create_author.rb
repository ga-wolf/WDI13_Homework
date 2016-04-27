class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.text :name
      t.text :nationality
      t.date :dob
      t.timestamps 
    end
  end
end
