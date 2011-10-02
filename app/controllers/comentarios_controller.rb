class ComentariosController < ApplicationController
  
  # before_filter :authenticate, :only => :destroy

  def create
     @post = Post.find params[:post_id]
     @comentario = @post.comentarios.create params[:comentario]
     # @comentario = Comentario.find params[:comentario]
     p "=============================== #{@comentario.corpo}"
     if @comentario.save
       redirect_to :controller => :posts, :action => :show, :id => @post.id
     else
       p "=================================================="
     end
  end

  def destroy
     @post = Post.find params[:post_id]
     @comentario = @post.comentarios.find params[:id]
     @comentario.destroy
  end
end
