Rails.application.routes.draw do
  
  namespace :account do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :sessions, only: [ :create, :destroy] 
    resource except: [ :new, :create, :destroy]
    get "members/show" #フロフィール画面
    get "passwords/edit" => "passwords#edit" 
    get "members/index" #メンーバ一覧
    patch "passwords/edit" => "passwords#update"
  end

end
