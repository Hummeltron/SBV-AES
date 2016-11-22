class CreateCopies < ActiveRecord::Migration[5.0]
  def change
    create_table :copies do |t|
      t.integer :code
      t.string :label

      t.timestamps
    end
  end
end
