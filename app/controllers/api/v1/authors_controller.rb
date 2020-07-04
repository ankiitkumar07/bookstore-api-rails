class Api::V1::AuthorsController < ApplicationController
	def index
		authors = Author.order('created_at DESC')
		render json: {
			status: 'Success',
			message: 'Authors Collected',
			data: authors
		},
		status: :ok
	end

	def show
		author = Author.find(params[:id])
		render json: {
			status: 'Success',
			message: 'Author found',
			data: author
		},
		status: :ok
	end

	def create
		author = Author.create(author_params)
		if author.save
			render json: {
				status: 'Success',
				message: 'Author created',
				data: author
			},
			status: :ok
		else
			render json: {
				status: 'Error',
				message: 'Could not save author',
				data: author.errors
			},
			status: :unprocessable_entity
		end
	end

	def destroy
		author = Author.find(params[:id])
		author.delete
		render json: {
			status: 'Successful',
			message: 'Author was successfully deleted',
			data: author
		}, status: :ok
	end

	# Works for PUT and PATCH requests
	def update
		author = Author.find(params[:id])
		if author.update_attributes(author_params)
			render json: {
				status: 'Success',
				message: 'author Upadted',
				data: author
			},
			status: :ok
		else
			render json: {
				status: 'Error',
				message: 'Could not update author',
				data: author.errors
			},
			status: :unprocessable_entity
		end
	end



	private
	def author_params
		params.permit(:name)
	end
end
