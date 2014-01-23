class CommentsController < ApplicationController

	def new
		@article = Article.find(params[:article_id])
    	@comment = Comment.new
  	end

  	def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(params[:comment].permit(:text))
    @comment.article_id = @article.id
    @comment.user = current_user

    if @comment.save
      redirect_to '/articles'
    else
      render 'new'
    end
  end

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def show
  end
end
