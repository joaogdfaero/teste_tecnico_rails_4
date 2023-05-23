Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :netflixes
      post 'titles/import_csv', to: 'titles#import_csv'
      get 'testing', to: 'titles#method_test'
      post 'imp_csv', to: 'titles#import_csv'
    end
  end
end



