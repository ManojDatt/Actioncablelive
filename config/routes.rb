Rails.application.routes.draw do
  

root 'messages#index'

resources :messages do
	resources :comments
end

end
