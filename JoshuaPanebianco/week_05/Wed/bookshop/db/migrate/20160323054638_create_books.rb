class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      
      t.text :image
      t.timestamp
    end
  end
end
