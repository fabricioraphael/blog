class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  def index
    redirect_to :action => :create
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new params[:profile]
    
    if @profile.save
      current_user.profile = @profile
      redirect_to :controller => :posts, :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @profile = Profile.find params[:id]
  end
  
  def update
    @profile = Profile.find params[:id]
    if @profile.update_attributes params[:profile]
      redirect_to :controller => :posts, :action => :index
    else
      render :action => :edit
    end
  end
  
  def show
    @profile = Profile.find params[:id]
    @posts = @profile.user.posts
  end
end
