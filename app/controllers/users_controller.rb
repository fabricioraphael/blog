class UsersController < ApplicationController
   # before_filter :authenticate_user!
   layout 'admin'
   
   def index
    @users = User.all
   end
   
   def new
     @user = User.new
   end

   def create
     @user = User.new params[:user]
     @user.role = "commentator"
     if @user.save
        @user.profile = Profile.new
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
       redirect_to :action => :index
     else
       render :action => :edit
     end
   end
end
