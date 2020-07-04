class Api::V1::RecommendationsController < ApplicationController

	def index
		recommendations = Recommendation.where(:to_user_id => params[:id])
		render json: {
			status: 'Success',
			message: 'You have following recommendations',
			data: recommendations
		},
		status: :ok
	end

	def create
		recommendation = Recommendation.create(rec_params)
		if recommendation.save
			render json:{
				status: "Success",
				message: "You've recommended the book to your friend!",
				data: recommendation
			},
			status: :ok
		else
			render json: {
				status: "Error",
				message: "Cannot make this recommendation",
				data: recommendation.errors
			},
			status: :unprocessable_entity
		end
	end

	private 
	def rec_params
		params.permit(:from_user_id, :book_id, :to_user_id)
	end
end
