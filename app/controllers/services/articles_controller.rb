include ActionView::Helpers::TextHelper

class Services::ArticlesController < ApplicationController
  def index
    @articles = Article.all

    @articles_list = @articles.map do |a|
      { :id => a.id, :name => a.name, :description => a.description, :price => a.price, :total_in_shelf => a.total_in_shelf, :total_in_vault => a.total_in_vault, :store_name => a.store.name }
    end
    
    json_articles = Hash.new()

    if @articles.count > 1
      json_articles["articles"] = @articles_list
    else 
      json_articles["article"] = @articles_list
    end

    json_articles["success"] = true
    json_articles["total_elements"] = @articles.count
    
    respond_to do |format|
      format.html
      format.json { render :json => json_articles }
    end
  end
end