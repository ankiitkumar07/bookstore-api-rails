class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user, presence: true
  validates :book, presence: true
  validates :title,
			presence: true,
			length: { in: 4..50 }
  validates :body,
			presence: true,
			length: { in: 4..250 }

  validates :rating,
  		   :inclusion => { :in => [1, 2, 3, 4, 5], message: "Please enter a value from 1 to 5"}
end
