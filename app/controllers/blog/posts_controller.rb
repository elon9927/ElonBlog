module Blog
	class PostsController < BlogController

	  # GET /posts
	  # GET /posts.json
	  def index
	    @posts = Post.most_recent.published.page(params[:page]).per(6)
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
	    @post = Post.friendly.find(params[:id])
	  end

	end
end





