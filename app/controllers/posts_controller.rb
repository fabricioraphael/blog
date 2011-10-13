class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  # before_filter load_and_authorize_resource
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 7)
  end
  
  def new
    current_user.role
    authorize! :create, Post
    @post = Post.new
  end
  
  def create
    authorize! :create, Post
    @post = Post.new params[:post]
    @post.user = current_user
    
    if params[:post][:avatar].nil?
      @post.avatar = nil
    end
    
    if @post.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def show
    @post = Post.find params[:id]
    @comentario = @post.comentarios.new

  end
  
  def edit
    authorize! :update, Post
    @post = Post.find params[:id]
  end
  
  def update
    authorize! :update, Post
    @post = Post.find params[:id]
    
    if @post.update_attributes params[:post]
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    authorize! :destroy, Post
    @post = Post.find params[:id] 
    @post.destroy
    
    redirect_to :action => :index
  end
  
end
