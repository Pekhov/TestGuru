Rails.application.routes.draw do
  get 'tests/index'
  resources :tests do
    resources :questions # shallow: true
  end
end
