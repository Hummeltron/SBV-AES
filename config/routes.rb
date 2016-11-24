Rails.application.routes.draw do
  resources :bookdetails
  resources :books
  resources :copies
  resources :students
  resources :aesclasses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/'             => 'aesclasses#index'
  get '/classes'      => 'aesclasses#index'
  get '/students'     => 'students#index'
  get '/books'        => 'books#index'
  get '/bookdetails'  => 'bookdetails#index'
end
