module Blog
	class PostsController < BlogController

	  # GET /posts
	  # GET /posts.json
	  def index
	    @posts = Post.most_recent.published
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
	    @post = Post.friendly.find(params[:id])
	  end

	end
end

=begin
	  def search
	  	@posts = Post.new(post_params)
	    session[:is_search] = false
      if  params[:title]
				    session[:is_search] = true
			      @posts = @posts.search_by_title(params[:title])
	  	respond_to do |format|
		  		if @posts

	    		format.html {render :index }
			    end
		  	end
	  	end
		end

	  private

	    def post_params
	      params.require(:post).permit(:title, :body, :description, :banner_image_url)
	    end
=end



