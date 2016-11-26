class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.references :book, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.boolean :topay
      t.integer :code

      t.timestamps null: false
    end
  end
end
