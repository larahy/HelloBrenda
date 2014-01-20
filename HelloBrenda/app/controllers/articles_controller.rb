class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new params[:article].permit(:title, :content, :image_url1, :image_url2, :image_url3, :image_url4, :image_url5)
    
    if @article.save 
      redirect_to articles_path
    else
      render 'new'
    end
    
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    @article.update params[:article].permit(:title, :content, :image_url1, :image_url2, :image_url3, :image_url4, :image_url5, :tag)
    redirect_to '/articles'
  end

  def show
    @article = Article.find params[:id]
    puts @article  
    @tags = @article.tags
  end 

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    redirect_to '/articles'
  end 

end
