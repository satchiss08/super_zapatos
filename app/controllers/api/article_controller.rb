class API::ArticleController < ApplicationController
  def index
    @articles = Article.all
    respond_to do |format|
      format.json { render :json => @articles }
    end
  end
end