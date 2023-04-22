class ComentariosController < ApplicationController
  before_action :authenticate_author!
    before_action :set_post


    def create 
        @comentario = @post.comentarios.create(comentario_params)
        @comentario.author = current_author

        if @comentario.save
            flash[:notice] = "comment has been created"
            redirect_to post_path(@post)
        else
            flash[:notice] = "comment has not been created"
            redirect_to post_path(@post)
        
        end  
end


     def destroy
        comentario = @post.comentarios.find(params[:id])
        comentario.destroy
        redirect_to post_path(@post)
 end

 def update
    @comentario = @post.comentarios.find(params[:id])

    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to post_url(@post), notice: 'Comment has been updated' }
      else
        format.html { redirect_to post_url(@post), alert: 'Comment was not updated!' }
      end
    end
  end

    private
    def set_post
        @post = Post.find(params[:post_id])
    end


    def comentario_params 
        params.require(:comentario).permit(:body)

    end
    end