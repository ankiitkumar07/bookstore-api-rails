Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	# get '/u/:username', to: 'users#show_user_by_username'

  namespace 'api' do
  	namespace 'v1' do
  		resources :books
  		resources :authors
  		resources :genre
  		resources :users	
      resources :book_comments

  		get '/users/:id/books', to: 'book_shelves#show_books'
  		get '/books/:id/users', to: 'book_shelves#show_users'
  		post '/user/book_shelf', to: 'book_shelves#add_book'
  		delete '/user/:user_id/book/:book_id', to: 'book_shelves#destroy'

      get '/users/:id/recommendations', to: 'recommendations#index'
      post '/users/:id/recommendations', to: 'recommendations#create'

      get 'users/:id/followers', to: 'follow#get_followers'
      get 'users/:id/following', to: 'follow#get_followings'
      post '/users/follow', to: 'follow#create'

      # namespace 'users' do
      #   resources :follow
      #   get '/:id/followers', to: 'follow#get_followers'
      #   get '/:id/following', to: 'follow#get_following'
      # end

  	end
  end
end
