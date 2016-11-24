class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.numeric :price
      t.string :birth

      t.timestamps
    end
  end
end
