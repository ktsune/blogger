class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def update
    @article.update(article_params)
    # flash.notice = "Article '#{@article.title}' was updated!"
    redirect_to article_path(@article)
  end

  def edit
  end

private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
