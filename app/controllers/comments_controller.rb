class CommentsController < ApplicationController
	before_action :logged_in?
	before_action :set_comment, only: [:edit, :destroy, :update]
	before_action :authenticate, only: [:edit, :destroy, :update]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		redirect_to app_path(@comment.app)
	end

	def edit
	end

	def destroy
		@comment.destroy
		redirect_to app_path(@comment.app)
	end

	def update
		unless @comment.update(comment_params)
			render :edit and return
		end
		redirect_to app_path(@comment.app)
	end

private
	def comment_params
		params.require(:comment).permit(:content, :comment_type, :app_id, :user_id)
	end

	def authenticate
		unless @comment.user_id == session[:user_id]
			flash[:alert] = "You don't have authorization to #{@comment.user.name}'s comment!"
			redirect_to app_path(@comment.app)
		end
	end

	def set_comment
		@comment = Comment.find params[:id]
	end
end
