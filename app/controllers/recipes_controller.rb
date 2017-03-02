class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @cookeries = Cookery.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash[:notice] = 'Dado inválido'
      @cookeries = Cookery.all
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  private

  def recipe_params
  params.require(:recipe).permit(:name, :cookery_id, :food_type, :people_portion,
                                 :preparation_time, :difficult, :ingredients,
                                 :steps)
  end

end
