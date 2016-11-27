class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :label
      t.float :price
      t.text :isbn
      t.string :image

      t.timestamps null: false
    end
  end
end
