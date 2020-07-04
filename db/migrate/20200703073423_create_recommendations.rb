class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.references :from_user, null: false, foreign_key: { to_table: 'users' }
      t.references :book, null: false, foreign_key: true
      t.references :to_user, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
