class Api::V1::User::RegistrationsController < DeviseTokenAuth::RegistrationsController

	def create
		super
		profile = UserProfile.create(:user_id => @resource.id)
	end

	def render_create_success
		user = User.find(@resource.id)
		render json: {
		    status: 'success',
		    message: 'Welcome to your new BookStore Profile',
		    data:   user.as_json(include: {
						user_profile: {
							:only => [:user_phone, :pic_path]
						}
					}
		    	)
		}
	end
end
