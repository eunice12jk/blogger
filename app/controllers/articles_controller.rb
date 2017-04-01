class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
  	#@article = Article.find(params[:id])

  end

  def new
  	@article = Article.new

  end 

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
      #(title: params[:article][:title],
      #body: params[:article][:body])
    #@article.title = params[:article][:title]
    @article.save

    redirect_to article_path(@article)
  end


  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy

  	redirect_to article_path
  end
  

end
