class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
		@comment = Comment.new
	end

	def show
		@blog = Blog.find(params[:id])
		@comment = Comment.new
	end

	def new
		@blog = Blog.new
	end

	def create
		blog = Blog.new(blog_params)
		blog.content = params[:content][:text]
		blog.user_id = current_user.id
		if blog.save
			redirect_to "/blogs"
		else
			render "/blogs/new"
		end
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		blog = Blog.find(params[:id])
		blog.content = params[:content][:text]
		if blog.update(blog_params)
			flash[:message] = "blog updated!"
			redirect_to "/"
		else
			flash[:message] = "failed"
			render edit_blog_path
		end
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.comments.each do |comment|
			comment.destroy
		end
		blog.destroy
		flash[:message] = "blog deleted"
		redirect_to "/"
	end

	private
	def blog_params
		params.require(:blog).permit(:title,:content,:blog_id)
	end
end