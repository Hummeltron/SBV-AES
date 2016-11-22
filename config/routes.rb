Rails.application.routes.draw do
  resources :bookdetails
  resources :books
  resources :copies
  resources :students
  resources :aesclasses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
