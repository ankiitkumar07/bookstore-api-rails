class Api::V1::UsersController < ApplicationController

	def index
		users = User.where(:role => "USER").order(:created_at)
		render json: {
			status: 'Success',
			message: 'Users collected',
			data: users.as_json(:except => [:role, :encrypted_password]) 
		},
		status: :ok
	end

	def show
		user = User.find(params[:id])
		render json: {
			status: 'Succes', 
			message: 'User found', 
			data: user.as_json(include: {
				user_profile: {
					:only => [:user_phone, :pic_path]
				}
			})
		}, status: :ok
	end

	# def create
	# 	user = User.create(user_params)
	# 	# user.role = "USER"
	# 	if user.save
	# 		UserProfile.create(:user_id => user.id)
	# 		render json: {
	# 			status: 'Success', 
	# 			message: 'User created successfully', 
	# 			data: user.as_json(include: {
	# 				user_profile: {
	# 					:only => [:user_phone, :pic_path]
	# 				}
	# 			})
	# 		},
	# 		status: :ok
	# 	else
	# 		render json: {
	# 			status: 'Error',
	# 			message: 'Error occurred while creating User',
	# 			data: user.errors
	# 		},
	# 		status: :unprocessable_entity
	# 	end
	# end

	def destroy
		user = User.find(params[:id])
		user_profile = UserProfile.where(:user_id => user.id).first
		user_profile.delete
		user.delete
		render json: {
				status: 'Success', 
				message: 'User deleted successfully', 
				data: user.as_json(include: {
					user_profile: {
						:only => [:user_phone, :pic_path]
					}
				})
			},
			status: :ok
	end

	private
	def user_params
		params.permit(:first_name, :last_name, :email, :username, :password, :role)
	end
end
