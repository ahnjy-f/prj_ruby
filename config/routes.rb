Rails.application.routes.draw do
  
  namespace :account do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
    #追加
    get "members/show" #フロフィール画面
    get "passwords/show" #パスワード変更
    get "members/index" #メンーバ一覧
  end

end
