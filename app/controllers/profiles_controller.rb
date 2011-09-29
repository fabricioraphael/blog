class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
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
      redirect_to :controller => :home, :action => :index
    else
      render :action => :new
    end
  end
end
