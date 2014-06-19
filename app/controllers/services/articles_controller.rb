include ActionView::Helpers::TextHelper

class Services::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    json_articles = Hash.new()

    if @articles.count > 1
      json_articles["articles"] = @articles
    else 
      json_articles["article"] = @articles
    end

    json_articles["success"] = true
    json_articles["total_elements"] = @articles.count
    
    respond_to do |format|
      format.html
      format.json { render :json => json_articles }
    end
  end
end