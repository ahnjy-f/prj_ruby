Rails.application.routes.draw do

  namespace :accounts do
    root "top#index"
    get "login" => "session#index", as: :login
    post "session" => "session#create", as: :session
    delete "session" => "session#destroy"
  end

end
