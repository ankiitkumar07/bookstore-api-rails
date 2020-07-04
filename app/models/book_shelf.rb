class BookShelf < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_uniqueness_of :book, scope: :user, :message => "You have already added the book to your shelf"
end
