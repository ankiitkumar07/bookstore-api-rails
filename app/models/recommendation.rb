class Recommendation < ApplicationRecord
  belongs_to :from_user, :class_name => 'User'
  belongs_to :book
  belongs_to :to_user, :class_name => 'User'

  validates_uniqueness_of :from_user, scope: [:to_user, :book], message: "You have already recommended this book to User"
end
