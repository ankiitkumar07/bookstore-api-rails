class Api::V1::FollowController < ApplicationController

	def get_followers
		followers = Follow.where(:user_following => params[:id])
		users = Array.new

		followers.each do |item|
			users.push(User.find(item.user_follower_id))
		end
		render json: {
			status: "Succes",
			message: "List of followers",
			data: users.as_json(
					:only => [:username],
					:include => {
						:user_profile => {
							:only => [:pic_path]
						}
					}
				)
		},
		status: :ok
	end

	def get_followings
		followings = Follow.where(:user_follower => params[:id])

		users = Array.new

		followings.each do |item|
			users.push(User.find(item.user_following_id))
		end

		render json: {
			status: "Success",
			message: "List of followed users",
			data: users.as_json(
					:only => [:username],
					:include => {
						:user_profile => {
							:only => [:pic_path]
						}
					}
				)
		},
		status: :ok
	end

	def create
		relation = Follow.create(follow_params)
		if relation.user_following.role == "USER" && relation.user_follower.role == "USER"
			if relation.save
				render json: {
					status: "Success",
					message: "You are now following ",
					data: relation.user_follower.username.as_json
				},
				status: :ok
			else
				render json: {
					status: "Error",
					message: "An error has been occurred",
					data: relation.errors
				},
				status: :unprocessable_entity
			end
		else
			render json: {
				status: "Error",
				message: "You cannot follow an Admin",
				data: "The service you requested for is not yet available or is under maintainance. We aplogise."
			},
			status: :unprocessable_entity
		end
	end

	def update
		
	end

	def destroy

	end


	private 
	def follow_params
		params.permit(:user_follower_id, :user_following_id, :status)
	end
end
