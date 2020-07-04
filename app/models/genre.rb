class Genre < ApplicationRecord
	validates :name, presence: true, length: {minimum: 2}, :uniqueness => {:message => "Genre already added!"}
	has_many :books
end
