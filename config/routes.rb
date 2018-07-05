Rails.application.routes.draw do
  resources :blogs
	root "blogs#index"
  resources :comments
  post '/comment' => "comments#create"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
