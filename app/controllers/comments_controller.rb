class CommentsController < ApplicationController

  def new
  end

def create
	comment = Comment.new(comment_params)
	comment.blog_id = params[:blog_id]
	comment.user_id = current_user.id
	if !params[:replied_id]
		comment.replied_id = Comment.last.id
	else
		comment.replied_id = params[:replied_id]
	end
	if comment.save
		if !params[:replied_id]
			comment.replied_id += 1
			comment.save
		end
		redirect_to "/blogs/#{params[:blog_id]}"
	else
		# cookies[:fuck] = comment.errors.full_messages
		# cookies[:bloggo] = params[:blog_id]
		redirect_to "/"
	end
end

  def edit
  end

  def show
  end

  def index
  end

	private
	def comment_params
		params.require(:comment).permit(:content,:user_id,:blog_id,:replied_id)
	end
end