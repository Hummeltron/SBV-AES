<<<<<<< HEAD
{"changed":false,"filter":false,"title":"20161125150905_create_copies.rb","tooltip":"/db/migrate/20161125150905_create_copies.rb","value":"class CreateCopies < ActiveRecord::Migration\n  def change\n    create_table :copies do |t|\n      t.references :book, index: true, foreign_key: true\n      t.references :student, index: true, foreign_key: true\n      t.boolean :topay\n      t.integer :code\n\n      t.timestamps null: false\n    end\n  end\nend\n","undoManager":{"mark":-1,"position":-1,"stack":[]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":12,"column":0},"end":{"row":12,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1480205613735}
=======
{"filter":false,"title":"20161125150905_create_copies.rb","tooltip":"/db/migrate/20161125150905_create_copies.rb","undoManager":{"mark":-1,"position":-1,"stack":[]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":4,"column":36},"end":{"row":4,"column":40},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1480205613735,"hash":"2811d63c6a18a7525c9be8cb614f07b7eb081b9a"}
>>>>>>> origin/master
