class ArticlesController < ApplicationController

  before_action :fetch_post, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new params[:article].permit(:title, :content, :image, :tag_input)
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
  end

  def update
    @article.update params[:article].permit(:title, :content, :image, :tag_input)
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

  def fetch_post
    @article = Article.find(params[:id])
  end

end

 #tags = params["tags"].split(" ").map{|tag| Tag.first_or_create(:text => tag)}
  #Link.create(:url => url, :title => title, :tags => tags)
