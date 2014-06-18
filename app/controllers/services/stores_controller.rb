class Services::StoresController < ApplicationController
  def index
    @stores = Store.all
    respond_to do |format|
      format.json { render :json => @stores }
    end
  end
end