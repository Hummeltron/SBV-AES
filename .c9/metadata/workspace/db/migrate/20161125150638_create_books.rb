<<<<<<< HEAD
{"filter":false,"title":"20161125150638_create_books.rb","tooltip":"/db/migrate/20161125150638_create_books.rb","undoManager":{"mark":-1,"position":-1,"stack":[]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":5,"column":14},"end":{"row":5,"column":14},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1480205613735,"hash":"75d5716a9ad35e39bbedafcace545faa1c64fede"}
=======
{"changed":false,"filter":false,"title":"20161125150638_create_books.rb","tooltip":"/db/migrate/20161125150638_create_books.rb","value":"class CreateBooks < ActiveRecord::Migration\n  def change\n    create_table :books do |t|\n      t.string :label\n      t.float :price\n      t.string :isbn\n      t.string :image\n\n      t.timestamps null: false\n    end\n  end\nend\n","undoManager":{"mark":-1,"position":-1,"stack":[]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":5,"column":14},"end":{"row":5,"column":14},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1480205613735}
>>>>>>> origin/master
