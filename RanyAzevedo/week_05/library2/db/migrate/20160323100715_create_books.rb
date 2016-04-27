class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.text :image
      t.text :writer
      t.text :genre
      t.integer :year
      t.timestamps
    end
  end
end
