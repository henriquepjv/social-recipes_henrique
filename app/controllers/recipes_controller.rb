class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @recipes = Recipe.most_recent.limit(20)
    @cookeries = Cookery.all
    @foods = Food.all

    if params[:keywords].present?
     @allrecipes = Recipe.search params[:keywords], fields: [:name, :ingredients]
   end
  end

  def new
    @recipe = Recipe.new
    @cookeries = Cookery.all
    @foods = Food.all
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash[:notice] = 'Dado inválido'
      @foods = Food.all
      @cookeries = Cookery.all
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
      @recipe = Recipe.find(params[:id])
      @cookeries = Cookery.all
      @foods = Food.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update recipe_params
      redirect_to @recipe
    else
      render 'Editar'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(current_user.id)
  end


  private

  def recipe_params
  params.require(:recipe).permit(:name, :cookery_id, :food_id, :people_portion,
                                 :preparation_time, :difficult, :ingredients,
                                 :steps, :picture)
  end

end
