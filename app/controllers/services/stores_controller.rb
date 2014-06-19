require 'services/api/json_generator'

class Services::StoresController < ApplicationController

  def index
    @stores = Store.all
    @json_stores = json_generator.stores_parser
    
    respond_to do |format|
      format.html
      format.json { render :json => @json_stores }
    end
  end

  private

  def json_generator
    @json_generator ||= Services::Api::JsonGenerator.new(list: @stores, type: "store")
  end
end