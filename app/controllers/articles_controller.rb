class ArticlesController < ApplicationController

  before_action :fetch_user_article, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :update]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new params[:article].permit(:title, :content, :image, :tag_input, :price)
    @article.user = current_user

    if @article.save 
      redirect_to articles_path
    else
      render 'new'
    end
    
  end

  def index
    if params[:tag_id]
      @articles = Tag.find(params[:tag_id]).articles.order('created_at DESC')
    else
      @articles = Article.all.order('created_at DESC')
    end
  end

  def edit
  end

  def update
    @article.update params[:article].permit(:title, :content, :image, :tag_input, :price)
    redirect_to '/articles'
  end

  def show
    @article = Article.find params[:id]
    puts @article  
    @tags = @article.tags
  end 

  def destroy
    @article.destroy
    redirect_to '/articles'
  end 

  private

  def fetch_user_article
   # @article = Article.find_by(id: params[:id], user: current_user)
    @article = current_user.articles.find(params[:id])
  end

end

