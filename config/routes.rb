Rails.application.routes.draw do

	resources :articles, only: [ :index, :update ]
	root "articles#index"

	# api routes 
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles, only: [ :index, :update ]
    end
  end

end
