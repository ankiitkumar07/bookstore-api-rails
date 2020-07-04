class Book < ApplicationRecord
  #associations
  belongs_to :author
  belongs_to :genre
  has_many :users, through: :book_shelves
  has_many :book_comments
  has_many :recommendations

  #validations
  validates :title, presence: true, length: {minimum: 3}, :uniqueness => {:message => "Book title already exists!"}
  validates :price, presence: true
  validates :summary, presence: true
  validates :author_id, presence: true
  validates :genre_id, presence: true
  validates :isbn, presence: true

  # def as_json(options={})
  # 	super(:except => [:author_id, :genre_id],
  # 		:include => {
  # 			:author => {
  # 				:only => [:name]
  # 			},
  # 			:genre => {
  # 				:only => [:name]
  # 			}
  # 		})
  # end
end
