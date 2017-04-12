class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :favorite]

  def index
    @recipes = Recipe.most_recent.limit(20)
    @cookeries = Cookery.all
    @foods = Food.all

    if params[:search].present?
     @search_recipes = Recipe.search params[:search], fields: [:name, :ingredients]
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
      flash[:alert] = 'Preencha todos os campos'
      @foods = Food.all
      @cookeries = Cookery.all
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(current_user.id)
  end

  def favorite
    type = params[:type]
    @recipe = Recipe.find(params[:recipe])
    if type == "favorite"
      current_user.favorites << @recipe
    #  redirect_to :back, notice: 'Receita adicionada aos favoritos'
      redirect_back( fallback_location: (request.referer || root_path), notice: "Receita adicionada aos favoritos")

    end
# @recipe = Recipe.find(params[:recipe])
# if current_user.favorites << @recipe
#   redirect_to user_path(current_user.id)
#   flash[:alert] = "Receita adicionada aos favoritos #{@recipe.name}"
# end
  end


  private

  def recipe_params
  params.require(:recipe).permit(:name, :cookery_id, :food_id, :people_portion,
                                 :preparation_time, :difficult, :ingredients,
                                 :steps, :picture, :user_id)
  end

end
