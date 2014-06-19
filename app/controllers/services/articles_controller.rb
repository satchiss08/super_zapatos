include ActionView::Helpers::TextHelper

class Services::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    articles_parser
    json_response
  end

  def show
    if numeric?(params[:id])
      @articles = Article.where(:store_id => params[:id])
      if !@articles.empty?
        @articles = Article.where(:store_id => params[:id])
        articles_parser
        json_response
      else
        error_message(404)
      end
    else
      error_message(400)
    end
  end

  private

    def articles_parser
      @articles_list = @articles.map do |a|
        { :id => a.id, :name => a.name, :description => a.description, :price => a.price, :total_in_shelf => a.total_in_shelf, :total_in_vault => a.total_in_vault, :store_name => a.store.name }
      end
    end

    def json_response
      @json_articles = Hash.new()
      json_generator
      
      respond_to do |format|
        format.html
        format.json { render :json => @json_articles }
      end
    end

    def json_generator
      if @articles.count > 1
        @json_articles["articles"] = @articles_list
      else 
        @json_articles["article"] = @articles_list
      end

      @json_articles["success"] = true
      @json_articles["total_elements"] = @articles.count
    end

    def error_message(error)
      @json_articles = Hash.new()

      if error == 400
        @json_articles["error_msg"] = "Bad Request"
        @json_articles["error_code"] = 400
      else
        @json_articles["error_msg"] = "Record not Found"
        @json_articles["error_code"] = 404
      end

      @json_articles["success"] = false

      respond_to do |format|
        format.html
        format.json { render :json => @json_articles }
      end
    end

    def numeric?(object)
      true if Float(object) rescue false
    end
end