Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :netflixes
      post 'netflixes/import_csv', to: 'netflixes#import_csv'
      get 'testing', to: 'netflixes#method_test'
    end
  end
end



