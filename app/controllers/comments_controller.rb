class CommentsController < ApplicationController
	before_action :logged_in?
	before_action :set_comment, only: [:edit, :destroy, :update]
	before_action :authenticate, only: [:edit, :destroy, :update]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		unless @comment.update(comment_params)
			@errors = @comment.errors.full_messages
		end
		redirect_to app_path(params[:app_id])
	end

	def edit
	end

	def destroy
		@comment.destroy
		redirect_to app_path(@comment.app)
	end

	def update
		unless @comment.update(comment_params)
			@errors = @comment.erros.full_messages
		end
		redirect_to app_path(@comment.app_id)
	end

private
	def comment_params
		params.require(:comment).permit(:content, :app_id, :user_id)
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
