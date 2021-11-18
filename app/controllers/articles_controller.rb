class ArticlesController < ApplicationController
  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new()
  end

  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] ="Article was created successfully!"
      redirect_to @article
    else
      render 'new'
    end
    # redirect_to article_path(@article)

    # render plain: @article
    # render plain: @article.inspect
  end
end