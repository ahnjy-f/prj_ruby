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
    get "admin/show" => "admin#show"
    get "admin/:id/edit" => "admin#edit"
    patch "admin/:id" =>"admin#update"
  end


end
