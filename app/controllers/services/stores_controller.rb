class Services::StoresController < ApplicationController
  def index
    @stores = Store.all
    stores_parser
    json_generator
  end

  private

    def stores_parser
      @stores_list = @stores.map do |s|
        { :id => s.id, :name => s.name, :address => s.address }
      end
    end

    def json_generator
      json_stores = Hash.new()

      if @stores.count > 1
        json_stores["stores"] = @stores_list
      else 
        json_stores["store"] = @stores_list
      end
      
      json_stores["success"] = true
      json_stores["total_elements"] = @stores.count
      
      respond_to do |format|
        format.html
        format.json { render :json => json_stores }
      end
    end
end