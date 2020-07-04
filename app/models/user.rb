class User < ApplicationRecord
	has_one :user_profile, dependent: :destroy
	has_many :books, through: :book_shelves
	has_many :book_comments

	#RECOMMENDATION ASSOCIATIONS
	has_many :recommendations, :class_name => 'Recommendation', :foreign_key => 'from_user_id'
	has_many :recommends, :class_name => 'Recommendation', :foreign_key => 'to_user_id'

	#FOLLOW ASSOCIATIONS
	has_many :followers, :class_name => 'Follow', :foreign_key => 'user_follower'
	has_many :followings, :class_name => 'Follow', :foreign_key => 'user_following'

	validates :first_name, length: { minimum: 2 }, presence: true
	validates :last_name, length: { minimum: 2 }, presence: true
	validates :email, presence: true, :uniqueness => {message: "email already exists"}
	validates :username, 
				presence: true, 
				length: {minimum: 2}, 
				uniqueness: {message: "username is not available. please select another username"}
	validates :encrypted_password,
				presence: true,
				length: {in: 8..20}
	validates :role, inclusion: { in: %w(USER ADMIN SUPERADMIN),
						meesage: "%{value} is not a valid role"}
end
