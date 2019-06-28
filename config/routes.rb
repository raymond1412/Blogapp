Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

 root 'posts#index'
 get '/signup', to: 'users#new'
 get '/users/:id/edit', to: 'users#edit', as: 'edit_page'
 patch '/users/:id', to: 'users#update'

 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create' 
 get '/logout', to: 'sessions#destroy'
 delete '/logout' => 'sessions#destroy'   
 get'/sessions', to: 'sessions#create'



   resources :posts do
      member do
        get "like", to: "posts#upvote"
        get "dislike", to: "posts#downvote"   
	end

   resources :comments
      member do 
        get "upvote", to: "comments#upvote"
        get "downvote", to: "comments#downvote"

   end
end
  
   resources :posts do 
  	resources :comments
  end	
  
end
