class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.text :published
      t.text :edition
      t.text :editionyear
      t.text :image
      t.integer :author_id
      t.text :isbn
      t.timestamps
    end
  end
end
