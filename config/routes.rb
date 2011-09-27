Blog::Application.routes.draw do
  devise_for :users, :path => "usuarios", :path_names => {
     :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
   
   # devise_for :users, :controllers => { :sessions => "users/sessions" }
   
   resources :posts, :except => [:index]
   # resources :usuarios, :except => [:show]

   root :to => "home#index"
end
