class UserProfile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, :uniqueness => {message: "User already exists. New profile cannot be created."}
end
