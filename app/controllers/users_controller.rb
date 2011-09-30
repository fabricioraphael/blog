class UsersController < ApplicationController
   # before_filter :authenticate_user!
   
   # def index
   #   # @users = User.all
   #   redirect_to :controller => :home, :action => :index
   # end

   def new
     @user = User.new
   end

   def create
     @user = User.new params[:user]
     
     if @user.save
        sign_in @user
        redirect_to :controller => :profiles, :action => :new
     else
        render :action => :new
     end
   end

   def edit
       @user = User.find params[:id] 
   end

   def update
     @user = User.find params[:id]
     if @user.update_attributes params[:user]
       redirect_to :controller => :home, :action => :index
     else
       render :action => :edit
     end
   end
end
