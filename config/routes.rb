Rails.application.routes.draw do
 namespace :api do
  namespace :v1 do
    resources :netflixes
    root to: 'netflix#index'
end
