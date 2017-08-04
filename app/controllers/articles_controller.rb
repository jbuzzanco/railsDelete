class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  # hard delete. completely removes record from database.
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # soft delete attempt.
  def archive
    @article = Article.find(params[:id])
    @article.update_attribute(:displayed, false)

    redirect_to article_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
