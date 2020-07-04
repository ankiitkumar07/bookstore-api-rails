class Api::V1::BookCommentsController < ApplicationController

	def index
		comments = BookComment.where(:book_id => params[:book_id])
		render json: {
			status: 'Success',
			message: 'Comments found',
			data: comments
		},
		status: :ok
	end	

	def create
		comment = BookComment.create(comment_params)

		if comment.save
			render json: {
				status: "Success",
				message: "Comment added",
				data: comment
			},
			status: :ok
		else
			render json: {
				status: "Success",
				message: "Error adding comment",
				data: comment.errors
			},
			status: :unprocessable_entity
		end
	end

	def update 
		comment = BookComment.find(params[:id])
		if comment.update_attributes(comment_params)
			render json: {
				status: "Success",
				message: "Comment updated",
				data: comment
			},
			status: :ok
		else
			render json: {
				status: "Error",
				message: "Comment update failed",
				data: comment.errors
			},
			status: :unprocessable_entity
		end
	end

	def destroy
		comment = BookComment.find(params[:id])
		comment.delete

		render json: {
			status: "Success",
			message: "Comment deleted",
			data: comment
		},
		status: :ok
	end

	private 
	def comment_params
		params.permit(:user_id, :book_id, :title, :body, :rating)
	end
end
