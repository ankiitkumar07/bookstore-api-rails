class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :user_phone, unique: true
      t.string :pic_path

      t.timestamps
    end
  end
end
