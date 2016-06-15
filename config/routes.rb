Rails.application.routes.draw do
  resources :hello, only: %i(index)
  root 'hello#index'
end
