class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = t('forms.messages.success')
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = t('forms.messages.success')
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:body, :title)
  end
end