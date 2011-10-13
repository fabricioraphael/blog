Blog::Application.routes.draw do
  devise_for :users, :path => "usuarios", :path_names => {
     :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register', :new => 'register' }
  # devise_for :users, :controllers => { :sessions => "users/sessions" }
  
  resources :users
  resources :profiles
  resources :posts
  resources :comentarios
  
  root :to => "posts#index"
end
