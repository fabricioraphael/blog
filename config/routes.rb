Blog::Application.routes.draw do
  devise_for :users, :path => "usuarios", :path_names => {
     :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register', :new => 'register' }
  # devise_for :users, :controllers => { :sessions => "users/sessions" }
  
  resources :users, :except => [:show] 
  resources :profiles, :except => [:show]
  resources :posts, :except => [:index]
  


   root :to => "home#index"
end
