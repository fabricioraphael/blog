class ComentariosController < ApplicationController
  
  # before_filter :authenticate, :only => :destroy

  def create
     @post = Post.find params[:post_id]
     @comentario = @post.comentarios.create params[:comentario]
     @comentario.user = current_user
     if @comentario.save
       redirect_to :controller => :posts, :action => :show, :id => @post.id
     else
       p "Imprimir msg de err 'Err ao salvar Comentario'"
     end
  end

  def destroy
     @post = Post.find params[:post_id]
     @comentario = @post.comentarios.find params[:id]
     @comentario.destroy
  end
end
