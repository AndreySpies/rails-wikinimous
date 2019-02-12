class ArticlesController < ApplicationController
  before_action :find, only: %i[show edit destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(set_article)
    redirect_to article_path(@article)
  end

  def edit; end

  def update
    @article = find
    @article.update(set_article)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find
    @article = Article.find(params[:id])
  end

  def set_article
    params.require(:article).permit(:title, :content)
  end
end
