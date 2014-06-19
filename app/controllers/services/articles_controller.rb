require 'services/api/json_generator'
require 'services/error_message'

class Services::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @json_articles = json_generator.articles_parser

    respond_to do |format|
      format.html
      format.json { render :json => @json_articles }
    end
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

  def json_generator
    @json_generator ||= Services::Api::JsonGenerator.new(list: @articles, type: "article")
  end

  def error_message(code)
    @error_message ||= Services::ErrorMessage.new(code: code)
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