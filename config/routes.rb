Rails.application.routes.draw do
  
  namespace :account do
    root "top#index"
    get "login" => "session#new", as: :login
    post "session" => "session#create", as: :session
    delete "session" => "session#destroy"
  end

end
