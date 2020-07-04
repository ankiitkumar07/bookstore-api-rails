class Api::V1::BooksController < ApplicationController
	def index
		books = Book.order('created_at DESC')
		render json: {
			status: 'Success',
			message: 'Books Collected',
			data: books
		},
		status: :ok
	end

	def show
		book = Book.find(params[:id])
		render json: {
			status: 'Success',
			message: 'Book Found',
			data: book.as_json(include: {
				:book_comments => {
					:except => [:id, :book_id]
				},
				:author => {
	  				:only => [:name]
	  			},
	  			:genre => {
	  				:only => [:name]
	  			}
			})
		},
		status: :ok
	end

	def create
		book = Book.create(book_params)
		if book.save
			render json: {
				status: 'Success',
				message: 'Book Created',
				data: book
			},
			status: :ok
		else
			render json: {
				status: 'Error',
				message: 'Could not save Book',
				data: book.errors
			},
			status: :unprocessable_entity
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.delete
		render json: {
			status: 'Successful',
			message: 'Book was successfully deleted',
			data: book
		}, status: :ok
	end

	# Works for PUT and PATCH requests
	def update
		book = Book.find(params[:id])
		if book.update_attributes(book_params)
			render json: {
				status: 'Success',
				message: 'Book Upadted',
				data: book
			},
			status: :ok
		else
			render json: {
				status: 'Error',
				message: 'Could not update Book',
				data: book.errors
			},
			status: :unprocessable_entity
		end
	end



	private
	def book_params
		params.permit(:title, :summary, :price, :isbn, :book_path, :cover_path, :author_id, :genre_id)
	end
end
