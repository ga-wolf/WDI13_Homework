class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.date :publication
      t.text :genre
      t.text :image
      t.timestamps
    end
  end
end
