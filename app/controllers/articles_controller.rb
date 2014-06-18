class ArticlesController < ApplicationController

  def new
  	@article = Article.new
  end

  def create
    @article = Article.new(article_params)    
    if @article.save
      flash[:success] = "New Article Created!"
      redirect_to new_article_path
    else
      render 'new'
    end
  end

  private

    def article_params
      params.require(:article).permit(:name, :description, :price, :total_in_shelf, :total_in_vault, :store_id)
    end
end