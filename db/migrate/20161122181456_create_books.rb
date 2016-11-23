class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :label
      t.boolean :paid

      t.timestamps
    end
  end
end
