module Blog
	class SearchController < ApplicationController

		def search

			@posts = Array.new
		  session[:is_search] = false
		  if  params[:key]
			    session[:is_search] = true
		      @posts = Post.search_by_title(params[:key])
		      render :search

	  	end
		end

	end
end