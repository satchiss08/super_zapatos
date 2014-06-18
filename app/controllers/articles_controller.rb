class ArticlesController < ApplicationController

  def new
  	@article = Article.new
  end

  def create
    @article = Article.new(article_params)    
    if @article.save
      flash[:success] = "Nuevo Artículo Creado!"
      redirect_to new_article_path
    else
      render 'new'
    end
  end

  private

    def article_params
      params.require(:article).permit(:name, :description, :total_in_shelf, :total_in_vault)
    end
end