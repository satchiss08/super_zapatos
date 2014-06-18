class StoresController < ApplicationController

  def new
  	@store = Store.new
  end

  def create
    @store = Store.new(store_params)    
    if @store.save
      flash[:success] = "Nueva Tienda Creada!"
      redirect_to new_store_path
    else
      render 'new'
    end
  end

  private

    def store_params
      params.require(:store).permit(:name, :address)
    end
end