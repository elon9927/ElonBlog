module Blog
  class CommentsController < CommentController
    before_action :find_post, only: [:create, :destroy]

    def show

    end

    def new
      @comment = Comment.new
    end

  	def create
  		@comment = @post.comments.new(comment_params)
      @comment.update(commenter: current_author.email)
  		redirect_to post_path(@post)
  	end

    def destroy
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to post_path(@post), notice: 'Conment was successfully destroyed.' }

        format.json { head :no_content }
      end
    end

    private
    def comment_params
      params.require(:comment).permit(:commenter, :content)
    end
    def find_post
      @post = Post.friendly.find(params[:post_id])
    end
  end
end