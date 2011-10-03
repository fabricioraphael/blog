class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new params[:post]
    @post.user = current_user

    if @post.save
      redirect_to :controller => :home, :action => :index
    else
      render :action => :new
    end
  end
  
  def show
    @post = Post.find params[:id]
    @comentario = @post.comentarios.new
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def update
    @post = Post.find params[:id]
    
    if @post.update_attributes params[:post]
      redirect_to :controller => :home, :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @post = Post.find params[:id] 
    @post.destroy
    
    redirect_to :controller => :home, :action => :index
  end
  
end
