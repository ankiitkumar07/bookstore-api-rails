class Author < ApplicationRecord
	validates :name, presence: true, length: {minimum: 2}, :uniqueness => {:message => "Author already added!"}
	has_many :books
end
