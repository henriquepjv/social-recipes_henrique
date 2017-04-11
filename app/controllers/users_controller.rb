class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end

    def favorite
      @recipes = current_user.favorites
    end

    def unfavorite
      type = params[:type]

      if type == "unfavorite"
        @recipe = Recipe.find(params[:recipe])
        current_user.favorites.delete(@recipe)
        redirect_to :back, notice: 'Unfavorited #{@recipe.name}'

      else
        # Type missing, nothing happens
        redirect_to :back, notice: 'Nothing happened.'
      end
    end

end
