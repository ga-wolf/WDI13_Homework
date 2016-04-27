class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.text :year_published
      t.text :image
      t.text :summary
      t.timestamps
    end
  end
end
