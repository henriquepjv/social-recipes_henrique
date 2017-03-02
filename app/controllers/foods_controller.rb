class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      flash[:notice] = 'Dado inválido'
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end


  private

  def food_params
    params.require(:food).permit(:name)
  end

end
