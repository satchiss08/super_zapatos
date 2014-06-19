require 'services/api/json_generator'
require 'services/api/error_message'

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
    @articles = Article.where(:store_id => params[:id])
    @json_articles = create_json

    respond_to do |format|
      format.html
      format.json { render :json => @json_articles }
    end
  end

  private

  def create_json
    if numeric?(params[:id])
      if !@articles.empty?
        json_generator.articles_parser
      else
        error_message(404).error_generator
      end
    else
      error_message(400).error_generator
    end
  end 

  def numeric?(object)
    true if Float(object) rescue false
  end

  def json_generator
    @json_generator ||= Services::Api::JsonGenerator.new(list: @articles, type: "article")
  end

  def error_message(code)
    @error_message ||= Services::Api::ErrorMessage.new(code: code)
  end
end