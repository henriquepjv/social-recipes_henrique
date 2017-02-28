class CookeriesController < ApplicationController

  def new
    @cookery = Cookery.new
  end

  def create
    @cookery = Cookery.new(cookery_params)
    if @cookery.save
      redirect_to @cookery
    else
      flash[:notice] = 'Dado inválido'
      render :new
    end
  end

  def show
    @cookery = Cookery.find(params[:id])
  end

  private

  def cookery_params
    params.require(:cookery).permit(:name)
  end

end
