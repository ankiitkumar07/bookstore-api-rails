class Api::V1::GenreController < ApplicationController
	def index
		genre = Genre.order('created_at DESC')
		render json: {
			status: 'Success',
			message: 'Genre Collected',
			data: genre
		},
		status: :ok
	end

	def show
		genre = Genre.find(params[:id])
		render json: {
			status: 'Success',
			message: 'Genre found',
			data: genre
		},
		status: :ok
	end

	def create
		genre = Genre.create(genre_params)
		if genre.save
			render json: {
				status: 'Success',
				message: 'Genre created',
				data: genre
			},
			status: :ok
		else
			render json: {
				status: 'Error',
				message: 'Could not save genre',
				data: genre.errors
			},
			status: :unprocessable_entity
		end
	end

	def destroy
		genre = Genre.find(params[:id])
		genre.delete
		render json: {
			status: 'Successful',
			message: 'Genre was successfully deleted',
			data: genre
		}, status: :ok
	end

	# Works for PUT and PATCH requests
	def update
		genre = Genre.find(params[:id])
		if genre.update_attributes(genre_params)
			render json: {
				status: 'Success',
				message: 'Genre Upadted',
				data: genre
			},
			status: :ok
		else
			render json: {
				status: 'Error',
				message: 'Could not update genre',
				data: genre.errors
			},
			status: :unprocessable_entity
		end
	end



	private
	def genre_params
		params.permit(:name)
	end
end
