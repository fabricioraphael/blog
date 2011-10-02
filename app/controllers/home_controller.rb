class HomeController < ApplicationController
  # before_filter :authenticate_user!
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 7)
  end

end
