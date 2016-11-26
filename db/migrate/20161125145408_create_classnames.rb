class CreateClassnames < ActiveRecord::Migration
  def change
    create_table :classnames do |t|
      t.string :name
      t.integer :year

      t.timestamps null: false
    end
  end
end
