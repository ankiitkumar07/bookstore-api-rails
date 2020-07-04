class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, unique: true
      t.string :summary
      t.float :price
      t.string :isbn, unique: true
      t.string :book_path
      t.string :cover_path
      t.references :author, null: false, foreign_key: true
      t.references :genre

      t.timestamps
    end
  end
end
