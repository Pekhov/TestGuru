Rails.application.routes.draw do
  get 'tests/index'
  resources :tests do
    resources :questions # shallow: true
  end
  #get '/questions/:id/destroy', to: 'questions#destroy'

end
