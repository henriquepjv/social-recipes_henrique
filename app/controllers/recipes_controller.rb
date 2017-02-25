class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash[:notice] = 'Dado inválido'
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  private

  def recipe_params
  params.require(:recipe).permit(:name, :cookery, :food_type, :people_portion,
                                 :preparation_time, :difficult, :ingredients,
                                 :steps)
  end

end
