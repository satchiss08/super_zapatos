class Services::StoresController < ApplicationController
  def index
    @stores = Store.all
    json_stores = Hash.new()

    if @stores.count > 1
      json_stores["stores"] = @stores
    else 
      json_stores["store"] = @stores
    end
    
    json_stores["success"] = true
    json_stores["total_elements"] = @stores.count
    
    respond_to do |format|
      format.html
      format.json { render :json => json_stores }
    end
  end
end