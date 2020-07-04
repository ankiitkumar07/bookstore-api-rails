class Api::V1::BookShelvesController < ApplicationController

	def show_books
		books = BookShelf.where(:user_id => params[:id])
		render json: {
			'status': 'Success',
			'message': 'Books Collected from book-shelf',
			data: books.as_json(:only => [:id],
				:include => {
				book: {
					:only => [:title]
				}
			})
		},
		status: :ok
	end

	def show_users
		users = BookShelf.where(:book_id => params[:id])
		render json: {
			'status': 'Success',
			'message': 'Users having this book in their Shlef',
			data: users.as_json(:only => [:id],
				:include => {
				user: {
					:only => [:username]
				}
			})
		},
		status: :ok
	end

	def add_book
		book_shelf = BookShelf.create(book_shelf_params)
		if book_shelf.save
			render json: {
				status: "Success",
				message: "Book added to shelf",
				data: book_shelf.as_json(:only => [:id],
					:include => {
						:book => { :only => [:title] },
						:user => { :only => [:username] }
					}
					)
			},
			status: :ok
		else
			render json: {
				status: "Error",
				message: "Error occured while adding book",
				data: book_shelf.errors
			},
			status: :unprocessable_entity
		end
	end

	def destroy
		book_shelf = BookShelf.where(:user_id => params[:user_id], :book_id => params[:book_id]).first
		book_shelf.delete

		render json: {
			status: "Success",
			message: "Book removed from shelf",
			data: book_shelf.as_json(:only => [:id],
				include: {
					book: { :only => [:title] }
				}
				)
		}
	end

	private 
	def book_shelf_params
		params.permit(:user_id, :book_id)
	end
end
