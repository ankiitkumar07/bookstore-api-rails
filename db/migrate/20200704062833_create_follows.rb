class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :user_following, null: false, foreign_key: { to_table: 'users'}
      t.references :user_follower, null: false, foreign_key: { to_table: 'users' }
      t.string :status

      t.timestamps
    end
  end
end


#### I am the follower (user_follower) and I am following (user_following)