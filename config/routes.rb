Rails.application.routes.draw do
  
  namespace :account do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy] 
    
    # get "members/show" #フロフィール画面
    get "passwords/edit" => "passwords#edit" 
    get "members/index" #メンーバ一覧
    get "members/:id/detail" => "members#detail"
    patch "passwords/edit" => "passwords#update"
    
    resources :members, except: [ :destroy ]

    get "members/:id/edit" => "members#edit"
    post "members/:id/edit" => "members#edit"
    patch "members/:id" => "members#update"

    get "admin/show" => "admin#show"
  end


end
