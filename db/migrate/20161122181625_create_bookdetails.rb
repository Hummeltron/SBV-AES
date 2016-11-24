class CreateBookdetails < ActiveRecord::Migration[5.0]
  def change
    create_table :bookdetails do |t|
      t.numeric :ISBN
      t.boolean :Leihbuch
      t.string :imgpath
      t.numeric :preis

      t.timestamps
    end
  end
end
