Rails.application.routes.draw do
  get 'currencies/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'currencies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
