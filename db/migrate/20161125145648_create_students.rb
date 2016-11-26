class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.string :birth
      t.references :classname, index: true, foreign_key: true
      t.float :price

      t.timestamps null: false
    end
  end
end
