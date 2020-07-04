class CreateBookComments < ActiveRecord::Migration[6.0]
  def change
    create_table :book_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :title
      t.string :body
      t.integer :rating

      t.timestamps
    end
  end
end
