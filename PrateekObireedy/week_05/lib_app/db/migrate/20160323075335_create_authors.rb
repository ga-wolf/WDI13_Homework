class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.text :name
      t.text :image
      t.text :dob
      t.timestamps
    end
  end
end
