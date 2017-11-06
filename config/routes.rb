Rails.application.routes.draw do
  post 'score', to: 'pages#score'
  get 'guess', to: 'pages#guess'

  root to: 'pages#guess'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
